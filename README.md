# OpenCode Sandbox

This repository contains Docker configuration and scripts for running OpenCode 2 in a containerized environment.

## Files

| File | Description |
|------|-------------|
| `Dockerfile` | Defines the OpenCode sandbox container image with Ubuntu 26.04, Playwright, and OpenCode CLI |
| `build.sh` | Script to build the OpenCode sandbox Docker image with caching |
| `no-cache-build.sh` | Script to force rebuild the Docker image without using cache |
| `run.sh` | Script to run the OpenCode sandbox container interactively |
| `bash-function.sh` | Provides the `oc()` bash function for convenient container execution with persistent config |
| `.gitignore` | Excludes editor backup files (files ending with `~`) |

## Quick Start

### Using the `oc()` function (recommended)

Source the `bash-function.sh` file to add the `oc()` command to your shell:

```bash
source bash-function.sh
```

Then run OpenCode with:

```bash
oc
```

This function provides:
- Persistent configuration across sessions (maps `~/.config/opencode`, `~/.config/gh`, etc.)
- Isolated container name based on your working directory
- Resource limits (16GB RAM, 4 CPUs)

### Manual build and run

```bash
# Build the image
./build.sh

# Run the container
./run.sh
```

## Docker Image Contents

The `opencode-sandbox` image includes:
- Ubuntu 26.04
- OpenCode CLI v2.0.31
- Playwright with Chromium
- GitHub CLI (`gh`)
- Git
- Node.js and npm
- Fly.io CLI (`flyctl`)
