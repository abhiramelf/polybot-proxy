# Use the official Caddy image
FROM caddy:2-alpine

# Copy your Caddyfile configuration into the container
COPY Caddyfile /etc/caddy/Caddyfile
