#!/bin/bash
set -e

# Load .env
if [ -f .env ]; then
  set -o allexport
  source .env
  set +o allexport
fi

echo "Checking network on http://localhost:$RPC_PORT"

# Get peer count
PEERS_HEX=$(curl -s -X POST --data '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":1}' \
  -H "Content-Type: application/json" http://localhost:$RPC_PORT | jq -r .result)
#The curl command in Linux is a command-line tool used for transferring data to or from a server using various protocols
# Get block number
BLOCK_HEX=$(curl -s -X POST --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' \
  -H "Content-Type: application/json" http://localhost:$RPC_PORT | jq -r .result)

# Convert hex to decimal
PEERS_DEC=$((PEERS_HEX))
BLOCK_DEC=$((BLOCK_HEX))

echo "Peers: $PEERS_DEC"
echo "⛓Latest Block: $BLOCK_DEC"

