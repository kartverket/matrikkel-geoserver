import type { TokenClaims } from "./types.ts";
import { TokenAudienceError } from "./types.ts";

export function tokenAudienceIsAccepted(
  tokenClaims: TokenClaims,
  acceptedAudiences: string[],
): boolean {
  const audience = tokenClaims.aud;
  if (!audience) return false;

  const audienceList = Array.isArray(audience) ? audience : [audience];
  return audienceList.some((tokenAudience) => acceptedAudiences.includes(tokenAudience));
}

export function assertAudienceIsAccepted(
  tokenClaims: TokenClaims,
  acceptedAudiences: string[],
): void {
  if (!tokenAudienceIsAccepted(tokenClaims, acceptedAudiences)) {
    throw new TokenAudienceError("token audience mismatch");
  }
}
