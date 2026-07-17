import {config} from "./config.ts";
import * as oidc from "openid-client";
import {verifyBasicAuth} from "./auth.ts";
import {TokenCache} from "./tokenCache.ts";
import {createRemoteJWKSet} from "jose";

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

const jwksUri = oidcConfig.serverMetadata().jwks_uri!;
const jwks = createRemoteJWKSet(new URL(jwksUri));

const authorizationHeader = 'Basic XXX'
//const authorizationHeader = 'Basic XXX'
const token = await verifyBasicAuth(
    authorizationHeader,
    oidcConfig,
    new TokenCache(),
    jwks,
);

console.log('token', token);