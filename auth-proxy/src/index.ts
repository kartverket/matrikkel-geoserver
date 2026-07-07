import { createRemoteJWKSet } from "jose";
import * as oidc from "openid-client";
import { createApp } from "./app.ts";
import { config } from "./config.ts";
import { logger } from "./logger.ts";
import { TokenCache } from "./tokenCache.ts";

const issuerUrl = new URL(config.keycloakIssuerUrl);

// openid-client nekter HTTP-requests by default. I produksjon kjøres Keycloak alltid
// bak HTTPS, men lokalt brukes HTTP. Vi skrur av sjekken kun når URL-en er HTTP.
// eslint-disable-next-line @typescript-eslint/no-deprecated
const discoveryOptions =
  issuerUrl.protocol === "http:" ? { execute: [oidc.allowInsecureRequests] } : undefined;
const oidcConfig = await oidc.discovery(
  issuerUrl,
  config.keycloakClientId,
  undefined,
  undefined,
  discoveryOptions,
);

const jwksUri = oidcConfig.serverMetadata().jwks_uri;
if (!jwksUri) throw new Error("OIDC discovery did not return a jwks_uri");

const jwks = createRemoteJWKSet(new URL(jwksUri));

const app = createApp({
  jwks,
  acceptedAudiences: config.acceptedAudiences,
  geoserverUrl: config.geoserverUrl,
  healthEndpoint: config.healthEndpoint,
  oidcConfig,
  tokenCache: new TokenCache(),
});

logger.info({ port: config.port, geoserverUrl: config.geoserverUrl }, "proxy listening");

export default {
  port: config.port,
  fetch: app.fetch,
};
