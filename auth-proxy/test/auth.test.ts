import { beforeAll, describe, expect, it } from "bun:test";
import type { KeyLike } from "jose";
import { generateKeyPair, SignJWT } from "jose";
import * as oidc from "openid-client";
import { verifyBasicAuth, verifyBearerToken } from "../src/auth.ts";
import { TokenCache } from "../src/tokenCache.ts";
import {
  InvalidCredentialsError,
  TokenVerificationError,
  UpstreamAuthError,
} from "../src/types.ts";

let privateKey: KeyLike;
let publicKey: KeyLike;

async function signToken(
  claims: Record<string, unknown>,
  overrides?: { key?: KeyLike },
): Promise<string> {
  return new SignJWT(claims)
    .setProtectedHeader({ alg: "RS256" })
    .setIssuedAt()
    .setExpirationTime("1h")
    .sign(overrides?.key ?? privateKey);
}

function makeMockOidcConfig(
  mockFetch: (url: string) => Response | Promise<Response>,
): oidc.Configuration {
  const config = new oidc.Configuration(
    {
      issuer: "http://mock-keycloak",
      token_endpoint: "http://mock-keycloak/token",
      jwks_uri: "http://mock-keycloak/certs",
    },
    "test-client",
  );
  // eslint-disable-next-line @typescript-eslint/no-deprecated
  oidc.allowInsecureRequests(config);
  config[oidc.customFetch] = async (url: string) => mockFetch(url);
  return config;
}

beforeAll(async () => {
  const kp = await generateKeyPair("RS256");
  privateKey = kp.privateKey;
  publicKey = kp.publicKey;
});

describe("verifyBearerToken", () => {
  it("verifies a valid JWT and returns claims", async () => {
    const token = await signToken({
      sub: "user1",
      preferred_username: "alice",
      aud: "matrikkel-geoserver",
    });
    const claims = await verifyBearerToken(`Bearer ${token}`, publicKey);
    expect(claims.preferred_username).toBe("alice");
    expect(claims.sub).toBe("user1");
  });

  it("throws TokenVerificationError for an expired token", async () => {
    const token = await new SignJWT({ sub: "user1", aud: "matrikkel-geoserver" })
      .setProtectedHeader({ alg: "RS256" })
      .setIssuedAt(Math.floor(Date.now() / 1000) - 7200)
      .setExpirationTime(Math.floor(Date.now() / 1000) - 3600)
      .sign(privateKey);
    expect(verifyBearerToken(`Bearer ${token}`, publicKey)).rejects.toBeInstanceOf(
      TokenVerificationError,
    );
  });

  it("throws TokenVerificationError for a token signed with a different key", async () => {
    const { privateKey: otherKey } = await generateKeyPair("RS256");
    const token = await signToken({ sub: "user1", aud: "matrikkel-geoserver" }, { key: otherKey });
    expect(verifyBearerToken(`Bearer ${token}`, publicKey)).rejects.toBeInstanceOf(
      TokenVerificationError,
    );
  });

  it("returns realm_access roles in claims", async () => {
    const token = await signToken({
      sub: "u1",
      aud: "matrikkel-geoserver",
      realm_access: { roles: ["admin"] },
    });
    const claims = await verifyBearerToken(`Bearer ${token}`, publicKey);
    expect(claims.realm_access?.roles).toEqual(["admin"]);
  });
});

describe("verifyBasicAuth", () => {
  it("calls Keycloak and returns claims on valid credentials", async () => {
    const token = await signToken({ sub: "bob", preferred_username: "bob", aud: "matrikkel-geoserver" });
    const oidcConfig = makeMockOidcConfig(() =>
      Response.json({ access_token: token, token_type: "Bearer" }),
    );
    const claims = await verifyBasicAuth(
      `Basic ${btoa("bob:secret")}`,
      oidcConfig,
      new TokenCache(),
      publicKey,
    );
    expect(claims.preferred_username).toBe("bob");
  });

  it("does not call Keycloak on a second request (cache hit)", async () => {
    const token = await signToken({
      sub: "carol",
      preferred_username: "carol",
      aud: "matrikkel-geoserver",
    });
    let fetchCallCount = 0;
    const oidcConfig = makeMockOidcConfig(() => {
      fetchCallCount++;
      return Response.json({ access_token: token, token_type: "Bearer" });
    });
    const tokenCache = new TokenCache();
    await verifyBasicAuth(`Basic ${btoa("carol:secret")}`, oidcConfig, tokenCache, publicKey);
    await verifyBasicAuth(`Basic ${btoa("carol:secret")}`, oidcConfig, tokenCache, publicKey);
    expect(fetchCallCount).toBe(1);
  });

  it("throws InvalidCredentialsError when Keycloak returns 401", async () => {
    const oidcConfig = makeMockOidcConfig(() =>
      Response.json({ error: "invalid_grant" }, { status: 401 }),
    );
    expect(
      verifyBasicAuth(`Basic ${btoa("wrong:password")}`, oidcConfig, new TokenCache(), publicKey),
    ).rejects.toBeInstanceOf(InvalidCredentialsError);
  });

  it("throws UpstreamAuthError when Keycloak is unreachable", async () => {
    const oidcConfig = makeMockOidcConfig(() => {
      throw new Error("ECONNREFUSED");
    });
    expect(
      verifyBasicAuth(`Basic ${btoa("user:pass")}`, oidcConfig, new TokenCache(), publicKey),
    ).rejects.toBeInstanceOf(UpstreamAuthError);
  });

  it("throws InvalidCredentialsError for malformed credentials (empty username)", async () => {
    const oidcConfig = makeMockOidcConfig(() => Response.json({ access_token: "never" }));
    expect(
      verifyBasicAuth(`Basic ${btoa(":nouser")}`, oidcConfig, new TokenCache(), publicKey),
    ).rejects.toBeInstanceOf(InvalidCredentialsError);
  });
});
