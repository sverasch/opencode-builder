FROM ubuntu:26.04

RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl git nodejs npm \
 && rm -rf /var/lib/apt/lists/* \
 && npm install -g @opencode/cli@beta

# Ubuntu 24.04 and later ship a built-in "ubuntu" user with UID 1000.
# Use that user instead of creating a new one, since useradd -u 1000 would fail.
USER ubuntu
WORKDIR /workspace
ENTRYPOINT ["opencode"]
