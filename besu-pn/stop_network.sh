#!/bin/bash
echo "Stopping all Besu nodes..."
pkill -f "besu --config-file"
echo "All Besu processes terminated."

