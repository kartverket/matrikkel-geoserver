import * as oidc from "openid-client";
import type { JwksParam } from "./jwt.ts";
import { verifyJwt } from "./jwt.ts";
import type { TokenCache } from "./tokenCache.ts";
import type { TokenClaims } from "./types.ts";
import { InvalidCredentialsError, UpstreamAuthError } from "./types.ts";

export async function verifyBearerToken(
  authorizationHeader: string,
  jwks: JwksParam,
): Promise<TokenClaims> {
  const token = authorizationHeader.slice(7).trim();
  return verifyJwt(token, jwks);
}

export async function verifyBasicAuth(
  authorizationHeader: string,
  oidcConfig: oidc.Configuration,
  tokenCache: TokenCache,
  jwks: JwksParam,
): Promise<TokenClaims> {
  const base64Credentials = authorizationHeader.slice(6);
  const decoded = Buffer.from(base64Credentials, "base64").toString("utf-8");

  const colonIndex = decoded.indexOf(":");
  if (colonIndex <= 0) throw new InvalidCredentialsError("invalid basic credentials");

  const username = decoded.slice(0, colonIndex);
  const password = decoded.slice(colonIndex + 1);

  const cacheKey = authorizationHeader;
  let accessToken = tokenCache.get(cacheKey);

  if (!accessToken) {
    const { token, ttlSeconds } = await exchangeToken(oidcConfig, username, password);
    accessToken = token;
    tokenCache.set(cacheKey, accessToken, ttlSeconds);
  }

  return verifyJwt(accessToken, jwks);
}

async function exchangeToken(
  config: oidc.Configuration,
  username: string,
  password: string,
): Promise<{ token: string; ttlSeconds: number }> {
  let response: oidc.TokenEndpointResponse;
  try {
    response = await oidc.genericGrantRequest(config, "password", { username, password });
  } catch (error) {
    if (error instanceof oidc.ResponseBodyError) {
      if (error.status === 400 || error.status === 401)
        throw new InvalidCredentialsError("invalid username or password");
      throw new UpstreamAuthError(`identity provider error: ${error.error}`);
    }
    throw new UpstreamAuthError("identity provider unreachable");
  }

  if (!response.access_token) throw new UpstreamAuthError("no access token in response");
  return { token: response.access_token, ttlSeconds: ttlFromResponse(response) };
}

function ttlFromResponse(response: oidc.TokenEndpointResponse): number {
  if (response.expires_in != null && response.expires_in > 0) return response.expires_in;
  try {
    const payload = JSON.parse(
      Buffer.from(response.access_token?.split(".")[1], "base64url").toString(),
    );
    if (typeof payload.exp === "number")
      return Math.max(0, payload.exp - Math.floor(Date.now() / 1000));
  } catch {}
  return 60;
}
