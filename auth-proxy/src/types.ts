export interface TokenClaims {
  sub: string;
  aud?: string | string[];
  preferred_username?: string;
  email?: string;
  realm_access?: {
    roles?: string[];
  };
  [key: string]: unknown;
}

export class InvalidCredentialsError extends Error {
  constructor(message: string) {
    super(message);
    this.name = "InvalidCredentialsError";
  }
}

export class UpstreamAuthError extends Error {
  constructor(message: string) {
    super(message);
    this.name = "UpstreamAuthError";
  }
}

export class TokenAudienceError extends Error {
  constructor(message: string) {
    super(message);
    this.name = "TokenAudienceError";
  }
}

export class TokenVerificationError extends Error {
  constructor(message: string) {
    super(message);
    this.name = "TokenVerificationError";
  }
}
