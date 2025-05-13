#!/bin/bash
set -e

# Base ports and number of nodes
START_PORT=8545
NODES=4
EXPECTED_PEERS=0x3

echo "Checking network status..."

for ((i=0; i<NODES; i++)); do
    PORT=$((START_PORT + i))
    echo "Node $((i+1)) (RPC port: $PORT):"

    PEERS=$(curl -s -X POST http://localhost:$PORT \
        -H "Content-Type: application/json" \
        --data '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":1}' \
        | jq -r .result)

    BLOCK=$(curl -s -X POST http://localhost:$PORT \
        -H "Content-Type: application/json" \
        --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' \
        | jq -r .result)

    echo "  Peers: $PEERS (Expected: $EXPECTED_PEERS)"
    echo "  Block Number: $((16#${BLOCK:2}))"

    if [[ "$PEERS" != "$EXPECTED_PEERS" ]]; then
        echo "  ⚠️ Warning: Node $((i+1)) has unexpected peer count!"
    fi

    echo ""
done

