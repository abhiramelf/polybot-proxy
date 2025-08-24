# Use the official Caddy image
FROM caddy:2-alpine

# Switch to the root user to perform administrative tasks.
USER root

# Install the ca-certificates bundle for proper TLS verification.
RUN apk add --no-cache ca-certificates

# Add caddy user and group
RUN addgroup -S caddy && adduser -S -G caddy caddy

# Copy the Caddyfile
COPY Caddyfile /etc/caddy/Caddyfile

# Switch back to the non-root caddy user for running the server.
USER caddy
