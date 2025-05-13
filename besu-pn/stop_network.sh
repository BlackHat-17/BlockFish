#!/bin/bash
echo "🛑 Stopping all Besu nodes..."

# Stop all besu processes owned by the current user
pkill -f "besu.*config-file"

echo "✅ All Besu nodes stopped."

