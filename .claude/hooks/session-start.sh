#!/bin/bash
set -euo pipefail

# Only run in remote (Claude Code on the web) environment
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Start a preview HTTP server in the background on port 8080
cd "$CLAUDE_PROJECT_DIR"

# Kill any existing server on port 8080
pkill -f "python3 -m http.server 8080" 2>/dev/null || true

# Start new server in background
nohup python3 -m http.server 8080 > /tmp/preview-server.log 2>&1 &

echo "Preview server started on port 8080"
