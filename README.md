# Dotfiles

A reproducible Debian-based setup for:
- Dev PC (GNOME workstation)
- Laptop (LXQt lightweight node)
- Shared base system tools and configs

This repo is designed to be **modular and idempotent**:

You can safely re-run scripts without breaking the system.

**READ THE OUTPUTS OF THE SCRIPTS, they will tell you further steps**

---

# 🧠 Machines

## 🖥️ Dev PC (GNOME)
- Primary development environment
- Heavy workloads (Docker, GNOME, media tools)

## 💻 Laptop (LXQt)
- Lightweight portable system
- SSH + coding + sync

## ⚙️ Base system
- Shared CLI tools
- Shell, Git, Neovim, Docker, Flatpak
- Core dotfiles

---

# 🚀 Installation

## 1. Clone repository

```bash
git clone https://github.com/SysTest-official/dotfiles.git
cd dotfiles
```

## 2. Bootstrap repository (optional but recommended)

```bash
bash bootstrap.sh
```
This ensures the repo is present and up to date.

## 📦 Install order (IMPORTANT)

Run scripts in this order for a clean setup:
### Step 1 — Base system (required for all machines)
```bash
bash base/install.sh
```
### Step 2 — Machine-specific setup
### 💻 Laptop
```bash
bash laptop/install.sh
```
### 🖥️ Dev PC
```bash
bash dev/install.sh
```
