# syntax=docker/dockerfile:1
FROM ubuntu:26.04

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl dnsutils gh git nodejs npm openssh-client

# Chromium OS libraries, then the browser into a shared path.
ENV PLAYWRIGHT_BROWSERS_PATH=/opt/ms-playwright
RUN --mount=type=cache,target=/root/.npm \
    npm install -g playwright@latest \
 && npx playwright install-deps chromium \
 && npx playwright install chromium

# OpenCode 2 beta. Pinned to the version you chose; change to @beta to track the latest beta.
ARG OPENCODE2_VERSION=2.0.32
RUN --mount=type=cache,target=/root/.npm \
    npm install -g @opencode/cli@${OPENCODE2_VERSION}

# flyctl, installed system-wide.
RUN curl -fsSL https://fly.io/install.sh | FLYCTL_INSTALL=/usr/local sh

# Writable state folders for opencode.
RUN mkdir -p /home/ubuntu/.local/share/opencode /home/ubuntu/.local/state \
 && chown -R ubuntu:ubuntu /home/ubuntu/.local

USER ubuntu
WORKDIR /workspace
ENTRYPOINT ["opencode"]
