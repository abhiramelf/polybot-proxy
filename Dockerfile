# Use the official Caddy image
FROM caddy:2-alpine

# Switch to the root user to install packages
USER root

# Update package list and install the ca-certificates bundle
RUN apk add --no-cache ca-certificates

# Switch back to the non-root caddy user for security
USER caddy

# Copy your Caddyfile configuration into the container
COPY Caddyfile /etc/caddy/Caddyfile
