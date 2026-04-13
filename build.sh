#!/bin/bash
set -e

echo "[build] Installing dependencies..."
npm install

echo "[build] Compiling TypeScript..."
npm run build

echo "[build] Build complete."
