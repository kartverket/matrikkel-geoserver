import { Hono } from "hono";
import { proxy } from "hono/proxy";
import type * as oidc from "openid-client";
import { assertAudienceIsAccepted } from "./audience.ts";
import { verifyBasicAuth, verifyBearerToken } from "./auth.ts";
import type { JwksParam } from "./jwt.ts";
import { logger } from "./logger.ts";
import type { TokenCache } from "./tokenCache.ts";
import type { TokenClaims } from "./types.ts";
import {
  InvalidCredentialsError,
  TokenAudienceError,
  TokenVerificationError,
  UpstreamAuthError,
} from "./types.ts";

export interface AppDeps {
  jwks: JwksParam;
  acceptedAudiences: string[];
  geoserverUrl: string;
  healthEndpoint:string;
  oidcConfig: oidc.Configuration;
  tokenCache: TokenCache;
}

function unauthorizedResponse(detail: string): Response {
  return new Response(JSON.stringify({ error: "unauthorized", detail }), {
    status: 401,
    headers: {
      "Content-Type": "application/json",
      "WWW-Authenticate": 'Basic realm="matrikkel", Bearer realm="matrikkel"',
    },
  });
}

function forbiddenResponse(detail: string): Response {
  return new Response(JSON.stringify({ error: "forbidden", detail }), {
    status: 403,
    headers: { "Content-Type": "application/json" },
  });
}

function badGatewayResponse(detail: string): Response {
  return new Response(JSON.stringify({ error: "bad_gateway", detail }), {
    status: 502,
    headers: { "Content-Type": "application/json" },
  });
}

export function createApp(deps: AppDeps): Hono {
  const app = new Hono();

  app.get("/health", () => proxy(`${deps.geoserverUrl.replace(/\/$/, "")}${deps.healthEndpoint}`));

  app.all("*", async (c) => {
    const start = Date.now();
    const requestId = c.req.header("X-Request-ID") ?? crypto.randomUUID();
    const { pathname, search } = new URL(c.req.url);
    const log = logger.child({ requestId, method: c.req.method, path: pathname });

    const authorizationHeader = c.req.header("Authorization") ?? "";
    const lowerAuth = authorizationHeader.toLowerCase();

    let tokenClaims: TokenClaims;
    let authMethod: "bearer" | "basic";

    try {
      if (lowerAuth.startsWith("bearer ")) {
        authMethod = "bearer";
        tokenClaims = await verifyBearerToken(authorizationHeader, deps.jwks);
      } else if (lowerAuth.startsWith("basic ")) {
        authMethod = "basic";
        tokenClaims = await verifyBasicAuth(
          authorizationHeader,
          deps.oidcConfig,
          deps.tokenCache,
          deps.jwks,
        );
      } else {
        log.warn({ status: 401 }, "missing Authorization header");
        return unauthorizedResponse("missing Authorization header");
      }

      assertAudienceIsAccepted(tokenClaims, deps.acceptedAudiences);
    } catch (error) {
      if (error instanceof UpstreamAuthError) {
        log.error({ status: 502, err: error.message }, "upstream auth error");
        return badGatewayResponse(error.message);
      }
      if (error instanceof TokenAudienceError) {
        log.warn({ status: 403, err: error.message }, "token audience rejected");
        return forbiddenResponse(error.message);
      }
      if (error instanceof InvalidCredentialsError || error instanceof TokenVerificationError) {
        log.warn({ status: 401, err: error.message }, "authentication failed");
        return unauthorizedResponse(error.message);
      }
      log.warn({ status: 401 }, "authentication failed");
      return unauthorizedResponse("authentication failed");
    }

    const user = tokenClaims.preferred_username ?? tokenClaims.sub;
    const upstreamUrl = deps.geoserverUrl.replace(/\/$/, "") + pathname + search;

    const headers = new Headers(c.req.raw.headers);
    headers.delete("Authorization");
    headers.set("X-Forwarded-User", user);
    headers.set("X-Request-ID", requestId);

    const response = await proxy(upstreamUrl, { raw: c.req.raw, headers });

    log.info(
      { status: response.status, authMethod, user, durationMs: Date.now() - start },
      "request proxied",
    );

    return response;
  });

  return app;
}
