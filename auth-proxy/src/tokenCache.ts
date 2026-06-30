import { LRUCache } from "lru-cache";

export class TokenCache {
  private readonly store: LRUCache<string, string>;

  constructor(maxSize = 1000) {
    this.store = new LRUCache({ max: maxSize });
  }

  get(key: string): string | undefined {
    return this.store.get(key);
  }

  set(key: string, value: string, ttlSeconds: number): void {
    this.store.set(key, value, { ttl: ttlSeconds * 1000 });
  }
}
