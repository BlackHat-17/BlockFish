#!/bin/bash
set -e
set -x

BASE_DIR="/home/catpuccino/besu-pn"
BESU_BIN=$(which besu)

# Validate environment
if [[ ! -x "$BESU_BIN" ]]; then
    echo "Besu binary not found in PATH"
    exit 1
fi

cd "$BASE_DIR"

# Ensure gnome-terminal is installed
if ! command -v gnome-terminal &> /dev/null; then
    sudo apt update
    sudo apt install -y gnome-terminal
fi

# Node range (edit for more nodes)
NODES=(1 2 3 4)

for i in "${NODES[@]}"; do
    NODE_NAME="node$i"
    CONFIG_PATH="$BASE_DIR/$NODE_NAME/config.toml"
    LOG_PATH="$BASE_DIR/$NODE_NAME/$NODE_NAME.log"

    echo "Starting $NODE_NAME..."

    gnome-terminal \
        --title="Besu $NODE_NAME" \
        -- bash -ic "$BESU_BIN --config-file=$CONFIG_PATH --logging=INFO 2>&1 | tee $LOG_PATH; echo '$NODE_NAME stopped. Press Enter to close.'; read"
    
    sleep 0.5
done

echo "All nodes started. Check gnome-terminal windows or logs in node directories."

