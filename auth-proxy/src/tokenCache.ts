import { LRUCache } from "lru-cache";

export type TokenResult = {
  token: string;
  ttlSeconds: number;
};
export class TokenCache {
  private readonly store: LRUCache<string, string>;
  private readonly inFlight = new Map<string, Promise<string>>();

  constructor(maxSize = 1000) {
    this.store = new LRUCache({ max: maxSize });
  }

  get(key: string): string | undefined {
    return this.store.get(key);
  }

  set(key: string, value: string, ttlSeconds: number): void {
    this.store.set(key, value, { ttl: ttlSeconds * 1000 });
  }

  async getOrFetch(key: string, tokenProvider: () => Promise<TokenResult>): Promise<string> {
    const cached = this.get(key);
    if (cached) return cached;

    const existingRequest = this.inFlight.get(key);
    if (existingRequest) return existingRequest;

    const request = tokenProvider()
        .then(({ token, ttlSeconds }) => {
          const leeway = Math.floor(Math.min(0.1 * ttlSeconds, 30));
          this.set(key, token, ttlSeconds - leeway);
          return token;
        });

    this.inFlight.set(key, request);

    try {
      return await request;
    } finally {
      if (this.inFlight.get(key) === request) {
        this.inFlight.delete(key);
      }
    }
  }
}
