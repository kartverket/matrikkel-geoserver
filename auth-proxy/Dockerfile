FROM dhi.io/bun:1.4.4-alpine3.24-dev@sha256:da31284d76f059bc8d29ba93ba0098e46de8e97f1485aa07a5503d0dda958017 AS deps
WORKDIR /app
COPY package.json bun.lock ./
RUN bun install --frozen-lockfile --production

FROM dhi.io/bun:1.4.4-alpine3.24@sha256:109847d243a134c7fefc3f3d39d26c2b2080117b36149bb3b307de7ff81e9217
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY src/ ./src/

EXPOSE 80

CMD ["bun", "src/index.ts"]
