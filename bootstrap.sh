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
echo "base/install_base.sh"
echo "dev/install_dev.sh"
echo "laptop/install_laptop.sh"
