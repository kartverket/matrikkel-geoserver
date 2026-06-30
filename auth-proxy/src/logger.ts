import pino from "pino";

export const logger = pino({
  level: process.env.LOG_LEVEL ?? "info",
  base: { service: "matrikkel-auth-proxy" },
  timestamp: pino.stdTimeFunctions.isoTime,
});
