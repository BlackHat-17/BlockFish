```bash
#!/bin/bash
# Script to check the status of the Besu IBFT 2.0 network
set -e
cd /home/catpuccino/besu-pn

# Ensure jq is installed
if ! command -v jq &> /dev/null; then
    echo "Installing jq..."
    sudo apt update
    sudo apt install -y jq
fi

# Function to query JSON-RPC
query_rpc() {
    local node=$1
    local port=$2
    local method=$3
    local params=$4
    curl -s -X POST --data "{\"jsonrpc\":\"2.0\",\"method\":\"$method\",\"params\":$params,\"id\":1}" -H "Content-Type: application/json" http://127.0.0.1:$port | jq '.result'
}

# Check peer count and block number for each node
for i in {1..4}
do
    case $i in
        1) port=8545 ;;
        2) port=8546 ;;
        3) port=8547 ;;
        4) port=8548 ;;
    esac
    echo "Checking node$i (port $port)..."
    peer_count=$(query_rpc "node$i" $port "net_peerCount" "[]")
    block_number=$(query_rpc "node$i" $port "eth_blockNumber" "[]")
    echo "  Peer count: $peer_count"
    echo "  Block number: $block_number"
done

echo "Network check complete."
echo "Expected: Each node should have 3 peers (hex: \"0x3\"). Block number should increase over time."
```
