# Use the official Caddy image
FROM caddy:2-alpine

# Switch to the root user to install packages and manage files
USER root

# Install the ca-certificates bundle
RUN apk add --no-cache ca-certificates

# Copy your Caddyfile configuration into the container
COPY Caddyfile /etc/caddy/Caddyfile

# IMPORTANT: Change the ownership of the Caddyfile to the 'caddy' user
RUN chown caddy:caddy /etc/caddy/Caddyfile

# Switch back to the non-root caddy user for security before running the server
USER caddy
