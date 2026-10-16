oc() {
  docker run -it --rm \
    --name "opencode-$(basename "$PWD")" \
    -v "$PWD":/workspace \
    -v "$HOME/.config/opencode":/home/ubuntu/.config/opencode \
    -v "$HOME/.config/gh":/home/ubuntu/.config/gh \
    -v "$HOME/.local/share/opencode-sandbox":/home/ubuntu/.local/share/opencode \
    -v "$HOME/.fly":/home/ubuntu/.fly \
    -v "$HOME/.ssh":/home/ubuntu/.ssh \
    -e ANTHROPIC_API_KEY \
    --cap-drop=ALL --security-opt no-new-privileges:true \
    --memory 16g --cpus 4 --pids-limit 512 \
    opencode-sandbox "$@"
}
