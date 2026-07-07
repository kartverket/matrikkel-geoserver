import { z } from "zod";

const envSchema = z.object({
  KEYCLOAK_ISSUER_URL: z.url(),
  KEYCLOAK_CLIENT_ID: z.string().min(1),
  ACCEPTED_AUDIENCES: z.string().min(1),
  GEOSERVER_URL: z.url(),
  HEALTH_ENDPOINT: z.string().min(1),
  PORT: z.coerce.number().int().positive(),
});

const env = envSchema.parse(process.env);

export const config = {
  keycloakIssuerUrl: env.KEYCLOAK_ISSUER_URL,
  keycloakClientId: env.KEYCLOAK_CLIENT_ID,
  acceptedAudiences: env.ACCEPTED_AUDIENCES.split(",").map((a) => a.trim()),
  geoserverUrl: env.GEOSERVER_URL,
  healthEndpoint: env.HEALTH_ENDPOINT,
  port: env.PORT,
} as const;
