import { describe, expect, it } from "bun:test";
import { tokenAudienceIsAccepted } from "../src/audience.ts";
import type { TokenClaims } from "../src/types.ts";

const acceptedAudiences = ["matrikkel-geoserver", "account"];

describe("tokenAudienceIsAccepted", () => {
  it("returns true when aud is a string matching an accepted audience", () => {
    const claims: TokenClaims = { sub: "u1", aud: "matrikkel-geoserver" };
    expect(tokenAudienceIsAccepted(claims, acceptedAudiences)).toBe(true);
  });

  it("returns true when aud is an array containing an accepted audience", () => {
    const claims: TokenClaims = { sub: "u1", aud: ["other-service", "account"] };
    expect(tokenAudienceIsAccepted(claims, acceptedAudiences)).toBe(true);
  });

  it("returns false when aud does not match any accepted audience", () => {
    const claims: TokenClaims = { sub: "u1", aud: "some-other-service" };
    expect(tokenAudienceIsAccepted(claims, acceptedAudiences)).toBe(false);
  });

  it("returns false when aud is absent", () => {
    const claims: TokenClaims = { sub: "u1" };
    expect(tokenAudienceIsAccepted(claims, acceptedAudiences)).toBe(false);
  });

  it("returns false when aud is an empty array", () => {
    const claims: TokenClaims = { sub: "u1", aud: [] };
    expect(tokenAudienceIsAccepted(claims, acceptedAudiences)).toBe(false);
  });
});
