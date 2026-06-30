import { beforeAll, describe, expect, it, spyOn } from "bun:test";
import type { KeyLike } from "jose";
import { generateKeyPair, SignJWT } from "jose";
import * as oidc from "openid-client";
import { createApp } from "../src/app.ts";
import { TokenCache } from "../src/tokenCache.ts";

let privateKey: KeyLike;
let publicKey: KeyLike;

async function signToken(claims: Record<string, unknown>): Promise<string> {
  return new SignJWT(claims)
    .setProtectedHeader({ alg: "RS256" })
    .setIssuedAt()
    .setExpirationTime("1h")
    .sign(privateKey);
}

function makeMockOidcConfig(accessToken: string | null): oidc.Configuration {
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
  config[oidc.customFetch] = async () => {
    if (!accessToken) return Response.json({ error: "invalid_grant" }, { status: 401 });
    return Response.json({ access_token: accessToken, token_type: "Bearer" });
  };
  return config;
}

beforeAll(async () => {
  const kp = await generateKeyPair("RS256");
  privateKey = kp.privateKey;
  publicKey = kp.publicKey;
});

function makeApp(keycloakToken: string | null = null) {
  return createApp({
    jwks: publicKey,
    acceptedAudiences: ["matrikkel-geoserver"],
    geoserverUrl: "http://mock-geoserver",
    oidcConfig: makeMockOidcConfig(keycloakToken),
    tokenCache: new TokenCache(),
  });
}

describe("Bearer token auth", () => {
  it("forwards request to GeoServer with valid token", async () => {
    const fetchSpy = spyOn(global, "fetch").mockResolvedValueOnce(
      new Response("ok", { status: 200 }),
    );
    const token = await signToken({ sub: "u1", preferred_username: "alice", aud: "matrikkel-geoserver" });
    const res = await makeApp().request("/geoserver/wms", {
      headers: { Authorization: `Bearer ${token}` },
    });
    expect(res.status).toBe(200);
    fetchSpy.mockRestore();
  });

  it("returns 401 with no Authorization header", async () => {
    const res = await makeApp().request("/geoserver/wms");
    expect(res.status).toBe(401);
    expect(res.headers.get("WWW-Authenticate")).toContain("Bearer");
  });

  it("returns 401 for expired token", async () => {
    const expired = await new SignJWT({ sub: "u1", aud: "matrikkel-geoserver" })
      .setProtectedHeader({ alg: "RS256" })
      .setIssuedAt(Math.floor(Date.now() / 1000) - 7200)
      .setExpirationTime(Math.floor(Date.now() / 1000) - 3600)
      .sign(privateKey);
    const res = await makeApp().request("/geoserver/wms", {
      headers: { Authorization: `Bearer ${expired}` },
    });
    expect(res.status).toBe(401);
  });

  it("returns 403 when token audience does not match", async () => {
    const token = await signToken({ sub: "u1", aud: "other-service" });
    const res = await makeApp().request("/geoserver/wms", {
      headers: { Authorization: `Bearer ${token}` },
    });
    expect(res.status).toBe(403);
  });
});

describe("Basic auth", () => {
  it("forwards request to GeoServer with valid credentials", async () => {
    const fetchSpy = spyOn(global, "fetch").mockResolvedValueOnce(
      new Response("ok", { status: 200 }),
    );
    const token = await signToken({ sub: "u1", preferred_username: "alice", aud: "matrikkel-geoserver" });
    const res = await makeApp(token).request("/geoserver/wms", {
      headers: { Authorization: `Basic ${btoa("alice:secret")}` },
    });
    expect(res.status).toBe(200);
    fetchSpy.mockRestore();
  });

  it("returns 401 when Keycloak rejects credentials", async () => {
    const res = await makeApp(null).request("/geoserver/wms", {
      headers: { Authorization: `Basic ${btoa("wrong:password")}` },
    });
    expect(res.status).toBe(401);
  });
});
