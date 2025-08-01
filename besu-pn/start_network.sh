#!/bin/bash
set -e

cd "$BASE_DIR"

# Load environment variables from .env if available
if [ -f .env ]; then
  echo "Loading environment variables from .env..."
  set -o allexport
  source .env
  set +o allexport
fi

# Check if besu is installed
if ! command -v "$BESU_BIN" &> /dev/null; then
  echo "❌ Error: '$BESU_BIN' not found. Please install Besu or set BESU_BIN in your .env."
  exit 1
fi

# Start each node in a new gnome-terminal window
for i in $(seq 1 "$NUM_NODES"); do
  NODE_NAME="$NODE_PREFIX$i"
  NODE_DIR="$BASE_DIR/$NODE_NAME"
  P2P_PORT=$((START_PORT_P2P + i - 1))
  RPC_PORT=$((START_PORT_RPC + i - 1))

  echo "Starting $NODE_NAME (P2P: $P2P_PORT, RPC: $RPC_PORT)..."

  gnome-terminal --title="$NODE_NAME" -- bash -c "
    $BESU_BIN \
      --config-file=\"$NODE_DIR/config.toml\" \
      --genesis-file=\"$BASE_DIR/$GENESIS_FILE\" \
      --data-path=\"$NODE_DIR/data\" \
      --p2p-port=$P2P_PORT \
      --rpc-http-port=$RPC_PORT \
      --logging=INFO \
      2>&1 | tee \"$NODE_DIR/${NODE_NAME}.log\";
    echo '$NODE_NAME stopped. Press Enter to close window.'; read"
  sleep 0.3
done

echo "All nodes started. View logs in each terminal or in node logs."

