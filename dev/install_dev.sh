#!/bin/bash
set -euo pipefail

DOTFILES="$HOME/dotfiles"

sudo apt update

sudo apt install -y task-gnome-desktop mesa-vulkan-drivers libvulkan1 libgl1

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# same dotfile links (reuse base layout)
ln -sf "$DOTFILES/shell/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/git/gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES/nvim" "$HOME/.config/nvim"

echo "DaVinci Resolve must be installed manually from Blackmagic."
