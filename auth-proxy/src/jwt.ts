import { type JWTVerifyGetKey, jwtVerify, type KeyLike } from "jose";
import type { TokenClaims } from "./types.ts";
import { TokenVerificationError } from "./types.ts";

export type JwksParam = KeyLike | JWTVerifyGetKey;

export async function verifyJwt(token: string, jwks: JwksParam): Promise<TokenClaims> {
  try {
    const { payload } = await jwtVerify(token, jwks as KeyLike, {
      algorithms: ["RS256"],
    });
    return payload as unknown as TokenClaims;
  } catch (error) {
    const message = error instanceof Error ? error.message : "token verification failed";
    throw new TokenVerificationError(message);
  }
}
