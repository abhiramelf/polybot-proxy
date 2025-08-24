# Use official Caddy Alpine image
FROM caddy:2-alpine

USER root

# Install certs, add caddy user, fix dirs
RUN apk add --no-cache ca-certificates \
    && addgroup -S caddy && adduser -S -G caddy caddy \
    && mkdir -p n8n/data n8n/config \
    && chown -R caddy:caddy n8n/data n8n/config /etc/caddy

# Copy config
COPY Caddyfile /etc/caddy/Caddyfile
RUN chown caddy:caddy /etc/caddy/Caddyfile

USER caddy

# Railway sets $PORT → bind to that
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
