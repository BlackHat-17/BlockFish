```bash
#!/bin/bash
# Script to stop the Besu IBFT 2.0 network
set -e
cd /home/catpuccino/besu-pn

# Stop all Besu processes
echo "Stopping Besu nodes..."
pkill -f "besu" || true

# Wait briefly to ensure processes terminate
sleep 2

# Verify no Besu processes are running
if pgrep -f "besu" > /dev/null; then
    echo "Warning: Some Besu processes may still be running. Check with 'ps aux | grep besu'."
else
    echo "All Besu nodes stopped."
fi
```
