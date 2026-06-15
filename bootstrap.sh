#!/bin/bash
set -euo pipefail

REPO_URL="https://github.com/SysTest-official/dotfiles.git"
DIR="$HOME/dotfiles"

if [ ! -d "$DIR" ]; then
  git clone "$REPO_URL" "$DIR"
else
  cd "$DIR" && git pull
fi

echo "Dotfiles ready. Run one of:"
echo "bash base/install.sh"
echo "bash dev/install.sh"
echo "bash laptop/install.sh"
