#!/bin/bash
set -euo pipefail

# directory permission
find . -type d -print0 | xargs -0 chmod 755

if ! command -v uv >/dev/null 2>&1; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
  export PATH="$HOME/.local/bin:$PATH"
fi

uv sync
