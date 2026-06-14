#!/bin/bash
set -euo pipefail

DOTFILES="$HOME/dotfiles"

sudo apt update && sudo apt upgrade -y

sudo apt install -y \
  curl git chromium neovim alacritty zsh \
  flatpak rsync syncthing keepassxc vlc gimp obs-studio \
  ca-certificates gnupg

# Flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Flatpak apps
xargs -a "$DOTFILES/flatpak/flatpaks.txt" flatpak install -y flathub || true

# Dotfiles linking
ln -sf "$DOTFILES/shell/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/shell/profile" "$HOME/.profile"
ln -sf "$DOTFILES/git/gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES/git/gitignore_global" "$HOME/.gitignore_global"
ln -sf "$DOTFILES/nvim" "$HOME/.config/nvim"
mkdir -p "$HOME/.config/alacritty"
ln -sf "$DOTFILES/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

# Docker
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/debian $(. /etc/os-release && echo $VERSION_CODENAME) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -aG docker "$USER"

chsh -s /usr/bin/zsh
