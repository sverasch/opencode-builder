#!/bin/bash
docker run -it --rm \
  --name opencode-sandbox \
  -v "$PWD":/workspace \
  -e ANTHROPIC_API_KEY \
  --cap-drop=ALL \
  --security-opt no-new-privileges:true \
  --memory 4g --cpus 2 --pids-limit 512 \
  opencode-sandbox
