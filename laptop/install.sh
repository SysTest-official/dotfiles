#!/bin/bash
set -euo pipefail

DOTFILES="$HOME/dotfiles"

sudo apt update

sudo apt install -y task-lxqt-desktop network-manager openssh-client syncthing

sudo systemctl enable NetworkManager

ln -sf "$DOTFILES/shell/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/git/gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES/nvim" "$HOME/.config/nvim"
