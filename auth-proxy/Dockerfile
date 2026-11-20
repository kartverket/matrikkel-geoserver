FROM dhi.io/bun:1.4.5-alpine-dev@sha256:40353a34f094ee556d48c6830d656d29619ab184f1a709055fd1baa58e8c391d AS deps
WORKDIR /app
COPY package.json bun.lock ./
RUN bun install --frozen-lockfile --production

FROM dhi.io/bun:1.4.5-alpine@sha256:de13301a2d83ee38fe6bd81e2f6dec95e157545a99b5907bb1e1d4b761abbf89
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY src/ ./src/

EXPOSE 80

CMD ["bun", "src/index.ts"]
