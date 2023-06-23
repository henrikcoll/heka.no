FROM rust:slim AS build

COPY --from=ghcr.io/getzola/zola:v0.17.2 /bin/zola /bin/zola

WORKDIR /app

COPY . .

RUN /bin/zola build

FROM nginx

WORKDIR /usr/share/nginx/html

COPY --from=build /app/public ./
