#!/bin/bash
set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO_DIR"

echo "[sync] Checking branch..."
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "none")

if [ "$CURRENT_BRANCH" = "HEAD" ] || [ "$CURRENT_BRANCH" = "none" ]; then
  echo "[sync] No branch detected. Creating 'main'..."
  git checkout -b main || git branch -M main
  CURRENT_BRANCH="main"
fi

echo "[sync] Current branch: $CURRENT_BRANCH"
git status

echo
read -rp "[sync] Commit message: " MSG

git add -A
git commit -m "$MSG" || echo "[sync] Nothing to commit."

echo
read -rp "[sync] Push to origin/$CURRENT_BRANCH? (y/n): " PUSH
if [[ "$PUSH" == "y" || "$PUSH" == "Y" ]]; then
  git push -u origin "$CURRENT_BRANCH"
else
  echo "[sync] Push skipped."
fi
