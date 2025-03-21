# Use an Alpine-based Node.js image
FROM node:22-alpine as builder

# Install dependencies
RUN apk add --no-cache git go curl libc6-compat

# Detect platform and install correct Hugo version
RUN arch=$(uname -m) && \
    if [ "$arch" = "aarch64" ]; then \
        curl -LO https://github.com/gohugoio/hugo/releases/download/v0.125.3/hugo_extended_0.125.3_Linux-arm64.tar.gz && \
        tar -xvzf hugo_extended_0.125.3_Linux-arm64.tar.gz && \
        cp hugo /usr/local/bin/hugo && \
        chmod +x /usr/local/bin/hugo && \
        rm -rf hugo_extended_0.125.3_Linux-arm64.tar.gz; \
    else \
        curl -LO https://github.com/gohugoio/hugo/releases/download/v0.125.3/hugo_extended_0.125.3_Linux-64bit.tar.gz && \
        tar -xvzf hugo_extended_0.125.3_Linux-64bit.tar.gz && \
        cp hugo /usr/local/bin/hugo && \
        chmod +x /usr/local/bin/hugo && \
        rm -rf hugo_extended_0.125.3_Linux-64bit.tar.gz; \
    fi && \
    ls -lah /usr/local/bin/hugo && echo "Hugo is installed correctly!" && /usr/local/bin/hugo version

# Ensure Hugo is in the system PATH
ENV PATH="/usr/local/bin:$PATH"

# Set working directory
WORKDIR /src

# Copy package files first
COPY package*.json ./
COPY themes/docsy/package*.json ./themes/docsy/

# Prevent Hugo-Extended from running post-install scripts
RUN npm install --ignore-scripts

# Install Docsy theme dependencies (without post-install scripts)
RUN cd themes/docsy && npm install --ignore-scripts

# Copy the rest of the files
COPY . .

# Debug Hugo installation before running build
RUN echo "Checking Hugo installation..." && ls -lah /usr/local/bin/hugo && hugo version

# Build the Hugo site
RUN hugo --minify

# Serve site using Nginx
FROM nginx:alpine
COPY --from=builder /src/public /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
