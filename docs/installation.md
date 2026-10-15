# Installation guide

This document explains how to set up a clean Arch Linux + KDE Plasma system with the files in this repository. It is intentionally conservative: it does not reinstall a desktop environment or replace an existing configuration without explicit review.

## Prerequisites

- working Arch Linux installation
- KDE Plasma or a Plasma-based desktop
- internet connection
- Git installed
- terminal access and basic Linux knowledge

Reference:

- [Arch Linux installation guide](https://wiki.archlinux.org/title/Installation_guide)
- [KDE Plasma documentation](https://kde.org/)

## Install Git

```bash
sudo pacman -S --needed git
```

## Clone the repository

```bash
git clone https://github.com/<your-user>/Arch-Linux-Dotfiles.git
cd Arch-Linux-Dotfiles
```

## Review package lists

```bash
cat packages/pacman-packages.txt
cat packages/aur-packages.txt
```

## Update the system

```bash
sudo pacman -Syu
```

## Install optional applications

```bash
sudo pacman -S --needed kitty fastfetch starship git
```

Only install the tools you actually want to use. These are optional dependencies for the documented configuration, not mandatory replacements for your existing desktop workflow.

## Review scripts before use

```bash
sed -n '1,220p' scripts/install-packages.sh
sed -n '1,220p' scripts/backup-configs.sh
sed -n '1,220p' scripts/restore-configs.sh
```

## Apply configuration files safely

Create the target directories if needed:

```bash
mkdir -p ~/.config/kitty ~/.config/starship ~/.config/fastfetch
```

Copy the starter files:

```bash
cp configs/kitty/kitty.conf ~/.config/kitty/kitty.conf
cp configs/starship/starship.toml ~/.config/starship/starship.toml
cp configs/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
```

## Configure KDE Plasma manually

Open System Settings and apply the following:

- global theme
- application style
- color scheme
- window decoration
- icon theme
- cursor theme
- font selection
- wallpaper
- panel layout
- keyboard shortcuts

Do not assume that changing one setting affects every program in the same way. Some apps use their own theme overrides.

## Verify the workspace

```bash
kitty --version
fastfetch
starship --version
```

If a command is missing, install it or correct the shell configuration.

## Optional: use the package installer script

```bash
bash scripts/install-packages.sh
```

This script reads tracked package lists, ignores comments and blanks, and asks for confirmation before installing packages. It intentionally does not automatically install AUR packages.

## Notes

This repository is intended for documentation and safe configuration management. Use it as a reference for a setup you can review, test, and customize.
