#!/bin/bash
set -e

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "[run] Starting AdaptiveProject..."
node "$PROJECT_DIR/dist/index.js"
