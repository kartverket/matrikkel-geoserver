FROM dhi.io/bun:1.4.4-alpine-dev@sha256:eeac9f33abcae851f1408466ccc598e3e43ef155a83142a9fad8343e4ae08590 AS deps
WORKDIR /app
COPY package.json bun.lock ./
RUN bun install --frozen-lockfile --production

FROM dhi.io/bun:1.4.4-alpine@sha256:109847d243a134c7fefc3f3d39d26c2b2080117b36149bb3b307de7ff81e9217
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY src/ ./src/

EXPOSE 80

CMD ["bun", "src/index.ts"]
