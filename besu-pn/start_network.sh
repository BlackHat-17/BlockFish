```bash
#!/bin/bash
# Script to start the Besu IBFT 2.0 network with four validator nodes
set -e
cd /home/catpuccino/besu-pn

# Ensure gnome-terminal is installed
if ! command -v gnome-terminal &> /dev/null; then
    echo "Installing gnome-terminal..."
    sudo apt update
    sudo apt install -y gnome-terminal
fi

# Start each node in a separate terminal with logging
echo "Starting node1..."
gnome-terminal --title="Besu Node 1" -- bash -c "besu --config-file=/home/catpuccino/besu-pn/node1/config.toml --logging=INFO > /home/catpuccino/besu-pn/node1/node1.log 2>&1"

echo "Starting node2..."
gnome-terminal --title="Besu Node 2" -- bash -c "besu --config-file=/home/catpuccino/besu-pn/node2/config.toml --logging=INFO > /home/catpuccino/besu-pn/node2/node2.log 2>&1"

echo "Starting node3..."
gnome-terminal --title="Besu Node 3" -- bash -c "besu --config-file=/home/catpuccino/besu-pn/node3/config.toml --logging=INFO > /home/catpuccino/besu-pn/node3/node3.log 2>&1"

echo "Starting node4..."
gnome-terminal --title="Besu Node 4" -- bash -c "besu --config-file=/home/catpuccino/besu-pn/node4/config.toml --logging=INFO > /home/catpuccino/besu-pn/node4/node4.log 2>&1"

echo "All nodes started. Check logs in node1/node1.log, node2/node2.log, etc."
echo "To verify the network, run ./check_network.sh"
echo "To stop the network, run ./stop_network.sh"
```
