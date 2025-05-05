# Stage 1: Build the Hugo site
FROM node:18-alpine AS builder

# Install dependencies
RUN apk add --no-cache git go curl tar gcompat libc6-compat libstdc++

# Set the Hugo version
ARG HUGO_VERSION=0.122.0

# Platform-aware Hugo install (ARM64 or AMD64)
WORKDIR /tmp

# Download and install Hugo directly
RUN set -ex && \
    arch=$(uname -m) && \
    if [ "$arch" = "aarch64" ]; then \
        curl -LO https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-ARM64.tar.gz && \
        tar -xzf hugo_extended_${HUGO_VERSION}_Linux-ARM64.tar.gz; \
    else \
        curl -LO https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz && \
        tar -xzf hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz; \
    fi && \
    mv hugo /usr/bin/hugo && chmod +x /usr/bin/hugo && \
    rm -f hugo_extended_${HUGO_VERSION}_*.tar.gz LICENSE README.md

# Verify Hugo installation
# RUN hugo version

# Copy site content
WORKDIR /src
COPY . .

# Build the site
# RUN hugo --minify && ls -lah public && test -f public/index.html
RUN hugo --minify --config hugo.toml && ls -lah public/

# Stage 2: 
  
# Serve the site with NGINX
FROM nginx:alpine

# Copy the built site from the builder stage
COPY --from=builder /src/public /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
