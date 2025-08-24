# Use the official Caddy image
FROM caddy:2-alpine

# Switch to the root user to install packages.
# We will stay as root to perform the file copy and then switch back at the end.
USER root

# Install the ca-certificates bundle
RUN apk add --no-cache ca-certificates

# Copy the Caddyfile and set its ownership to the 'caddy' user and group
# in a single, atomic step. This is the modern and most reliable way.
COPY --chown=caddy:caddy Caddyfile /etc/caddy/Caddyfile

# Now, switch back to the non-root caddy user for security before the server runs.
USER caddy
