# Arch-Linux-Dotfiles

Personal Arch Linux + KDE Plasma dotfiles featuring a minimal dual-tone desktop setup, terminal configuration, package lists, backup utilities, and reproducible setup documentation.

![Arch Linux](https://img.shields.io/badge/Arch%20Linux-1793D1?style=flat-square&logo=arch-linux&logoColor=white)
![KDE Plasma](https://img.shields.io/badge/KDE-Plasma-171717?style=flat-square&logo=kde&logoColor=white)

```text
$ arch --version
$ plasma-shell --version
> minimal dual-tone desktop
```

## Table of contents

- [Introduction](#introduction)
- [Features](#features)
- [Repository structure](#repository-structure)
- [Requirements](#requirements)
- [Installation guide](#installation-guide)
- [KDE Plasma customization](#kde-plasma-customization)
- [Terminal customization](#terminal-customization)
- [Package management](#package-management)
- [Backup and restore](#backup-and-restore)
- [Screenshots](#screenshots)
- [Troubleshooting](#troubleshooting)
- [Roadmap](#roadmap)
- [Contributing and license](#contributing-and-license)

## Introduction

This repository documents a personal Arch Linux + KDE Plasma desktop configuration designed around a minimal, clean dual-tone aesthetic. It is intended as a practical reference for building a reproducible workstation without adding unnecessary layers of automation or abstraction.

This project is not an official Arch Linux or KDE project, and it should not be treated as a generic desktop environment or Linux distribution. It is a personal workspace configuration assembled from portable documentation, starter config files, and safe Bash scripts.

The main goal is clarity: keep the system functional, readable, and easy to maintain while preserving a consistent appearance across wallpapers, panels, terminal output, and application styling.

## Features

- KDE Plasma desktop customization
- Dual-tone appearance and theme setup
- Application colors, icons, cursors, and fonts
- Wallpapers, panels, widgets, and desktop effects
- Keyboard shortcuts and window management
- Kitty terminal customization
- Fastfetch system information output
- Starship shell prompt
- Pacman package lists
- Separate AUR package documentation
- Backup and restore procedures
- Installation and troubleshooting guides
- Desktop screenshots and future improvements

## Repository structure

```text
Arch-Linux-Dotfiles/
├── README.md
├── LICENSE
├── .gitignore
├── packages/
│   ├── pacman-packages.txt
│   └── aur-packages.txt
├── kde/
│   ├── themes.md
│   ├── shortcuts.md
│   ├── panels-and-widgets.md
│   └── settings-backup.md
├── configs/
│   ├── kitty/
│   │   └── kitty.conf
│   ├── fastfetch/
│   │   └── config.jsonc
│   └── starship/
│       └── starship.toml
├── scripts/
│   ├── install-packages.sh
│   ├── backup-configs.sh
│   └── restore-configs.sh
├── wallpapers/
│   └── README.md
├── screenshots/
│   └── README.md
└── docs/
    ├── installation.md
    ├── customization.md
    └── troubleshooting.md
```

Directory purpose:

- `README.md`: repository overview, installation flow, and desktop guidance
- `packages/`: package lists for official repositories and AUR packages
- `kde/`: KDE-specific documentation and configuration notes
- `configs/`: minimal starter configs for Kitty, Fastfetch, and Starship
- `scripts/`: safe backup, restore, and package-install helper scripts
- `wallpapers/`: wallpaper notes and storage guidance
- `screenshots/`: screenshot gallery placeholder and capture notes
- `docs/`: installation, customization, and troubleshooting documentation

## Requirements

Before using these files, make sure you have:

- A working Arch Linux installation
- KDE Plasma installed and configured
- An active internet connection
- Git installed
- Comfortable use of a terminal

Official reference:
- [Arch Linux installation guide](https://wiki.archlinux.org/title/Installation_guide)
- [KDE Plasma documentation](https://kde.org/)
- [Arch Wiki](https://wiki.archlinux.org/)

## Installation guide

The repository is documentation-first and does not force a reinstall or a full desktop replacement. Use the steps below as a guided template.

1. Install Git:

```bash
sudo pacman -S --needed git
```

2. Clone the repository:

```bash
git clone https://github.com/<your-user>/Arch-Linux-Dotfiles.git
cd Arch-Linux-Dotfiles
```

3. Review the package lists:

```bash
cat packages/pacman-packages.txt
cat packages/aur-packages.txt
```

4. Update the system:

```bash
sudo pacman -Syu
```

5. Install optional applications manually when needed:

```bash
sudo pacman -S --needed kitty fastfetch starship git
```

6. Review scripts and configs before applying anything:

```bash
ls -R
sed -n '1,200p' scripts/install-packages.sh
sed -n '1,200p' configs/kitty/kitty.conf
```

7. Apply configuration files safely:

```bash
mkdir -p ~/.config/kitty ~/.config/starship
cp configs/kitty/kitty.conf ~/.config/kitty/kitty.conf
cp configs/starship/starship.toml ~/.config/starship/starship.toml
mkdir -p ~/.config/fastfetch
cp configs/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
```

8. Configure KDE Plasma manually through System Settings:

- Global Theme
- Application Style
- Color Scheme
- Window Decoration
- Icons and Cursors
- Fonts
- Wallpaper
- Panels and Widgets
- Keyboard Shortcuts

9. Verify the result:

```bash
kitty --version
fastfetch
starship --version
```

This repository is a reference, not a command to overwrite a system blindly. Keep the changes deliberate and review the settings you are applying.

## KDE Plasma customization

KDE Plasma offers multiple layers of configuration. The most common ones are:

### Global theme

A global theme changes the desktop appearance, including colors, widgets, and visual consistency. Use KDE System Settings to pick a theme and review the generated effect on windows, panels, and widgets.

### Application style

The application style controls the look of GTK or Qt-based applications. This is independent from the global theme and may not affect every program equally.

### Color scheme

A color scheme controls the palette used by apps and widgets. Use a grayscale or dual-tone palette to keep the setup minimal and consistent.

### Window decoration

Window decorations control titlebars, borders, and control buttons. A restrained style preserves readability and reduces visual noise.

### Icons and cursors

Choose a clean icon set and a cursor theme that matches the contrast and density of the desktop. Keep the palette consistent with the rest of the workspace.

### Fonts

Use a readable sans-serif or interface font. Keep font size consistent across panels, applications, and terminal output.

### Desktop wallpaper

A white or charcoal wallpaper works well for the dual-tone theme. Use a solid or lightly textured image to keep the layout clean.

### Panels and widgets

Keep the panel minimal: clock, application launcher, workspace switcher, system tray, and one or two useful widgets.

### Desktop effects

Disable unnecessary visual effects when the system is low-powered or when you want a more stable and lightweight desktop.

### Keyboard shortcuts

Document your shortcuts for:

- Application launcher
- Terminal
- Window movement
- Workspace switching
- Screen capture
- System actions

See also:
- [KDE documentation](https://develop.kde.org/docs/)
- [Arch Wiki: KDE](https://wiki.archlinux.org/title/KDE)
- [Arch Wiki: Desktop environments](https://wiki.archlinux.org/title/Desktop_environment)

## Terminal customization

This repository includes starter configuration files for the terminal tools below.

### Kitty

Kitty is a fast terminal emulator with a minimal and configurable interface.

Installation:

```bash
sudo pacman -S --needed kitty
```

Configuration file:

```bash
~/.config/kitty/kitty.conf
```

Starter config:

```bash
mkdir -p ~/.config/kitty
cp configs/kitty/kitty.conf ~/.config/kitty/kitty.conf
```

Recommended customizations:

- readable font size
- clean grayscale palette
- minimal padding
- square corners and quiet background

### Fastfetch

Fastfetch displays system information in a compact, readable layout.

Installation:

```bash
sudo pacman -S --needed fastfetch
```

Run it with:

```bash
fastfetch
```

Generate a default config:

```bash
mkdir -p ~/.config/fastfetch
fastfetch --gen-config > ~/.config/fastfetch/config.jsonc
```

Use the repository version as a starter:

```bash
cp configs/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
```

Keep output useful and privacy-aware. Avoid exposing personal identifiers or unnecessary system data.

### Starship

Starship provides a lightweight, customizable shell prompt.

Installation:

```bash
sudo pacman -S --needed starship
```

For Bash:

```bash
echo 'eval "$(starship init bash)"' >> ~/.bashrc
```

For Zsh:

```bash
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
```

Starter config:

```bash
mkdir -p ~/.config/starship
cp configs/starship/starship.toml ~/.config/starship/starship.toml
```

Minimal prompt design:

- current directory
- Git branch when applicable
- status indicator
- restrained grayscale contrast

## Package management

This repository keeps package names in plain text files so they are easy to review and modify.

### Pacman

Search:

```bash
pacman -Ss <package-name>
```

Install:

```bash
sudo pacman -S --needed <package-name>
```

Remove:

```bash
sudo pacman -Rns <package-name>
```

List explicitly installed packages:

```bash
pacman -Qe
```

Keep official repository package names in:

- `packages/pacman-packages.txt`

This file should contain one package per line. Comments and blank lines are allowed for organization.

### AUR

AUR packages are not official Arch repository packages and should be documented separately:

- `packages/aur-packages.txt`

Use an AUR helper such as `yay` only when you understand the workflow and trust the sources. This repository does not automatically install AUR packages.

### Review before installation

Always inspect the package list before installing anything:

```bash
cat packages/pacman-packages.txt
cat packages/aur-packages.txt
```

Use the included script for a safe, explicit install flow:

```bash
bash scripts/install-packages.sh
```

## Backup and restore

Backups are important because KDE Plasma and related app settings can vary by version, installed widgets, display layout, and hardware.

### Backup KDE configuration

The following files may be worth backing up:

- `~/.config/kdeglobals`
- `~/.config/kwinrc`
- `~/.config/plasmarc`
- `~/.config/plasma-org.kde.plasma.desktop-appletsrc`
- `~/.config/kscreenlockerrc`

Use the provided script:

```bash
bash scripts/backup-configs.sh
```

### Back up terminal configuration

Create a backup of the following when present:

- `~/.config/kitty/kitty.conf`
- `~/.config/fastfetch/config.jsonc`
- `~/.config/starship/starship.toml`

### Restore selected files

Use the restore script with a timestamped backup folder:

```bash
bash scripts/restore-configs.sh
```

During restore:

- review the source and target paths
- confirm before overwriting anything
- preserve a current backup before replacing a file
- avoid restoring unrelated configuration directories

### Verify ownership and permissions

Check whether files are readable and owned by the correct user:

```bash
ls -l ~/.config/kitty/kitty.conf
ls -l ~/.config/starship/starship.toml
ls -l ~/.config/fastfetch/config.jsonc
```

Fix ownership when necessary:

```bash
sudo chown "$USER:$USER" ~/.config/kitty/kitty.conf
```

### Recover from a broken configuration

If a setting breaks or a config file becomes invalid:

1. restore the last working backup
2. review the config file for syntax issues
3. test the application after each change
4. keep backup directories dated and descriptive

Do not overwrite the entire `~/.config` directory blindly. Prefer targeted, reviewed file restoration.

## Screenshots

This repository includes a screenshot placeholder structure for future documentation. If you have actual screenshots, place them in the `screenshots/` directory and reference them here.

Suggested gallery structure:

- `screenshots/desktop.png`
- `screenshots/terminal.png`
- `screenshots/app-launcher.png`
- `screenshots/system-settings.png`
- `screenshots/panels.png`

Do not claim screenshots are working or complete unless they have been captured and checked on a real system.

## Troubleshooting

Common issues and practical fixes:

### Themes not appearing

- confirm that the theme is installed
- update KDE Plasma settings
- inspect whether the application style differs from the global theme
- check if a specific app uses its own GTK/QT theme override

### Icons and cursors not changing

- verify the icon and cursor themes are installed
- open System Settings and reapply the icon theme
- check for app-specific overrides

### Terminal commands not being found

```bash
echo "$PATH"
which kitty
which starship
which fastfetch
```

### Shell initialization problems

Check Bash and Zsh config files:

```bash
bash -lc 'echo $SHELL'
cat ~/.bashrc
cat ~/.zshrc
```

If a tool is not initialized, add the correct line and reopen the terminal.

### Broken KDE settings

- revert recent theme changes
- review config files in `~/.config`
- test a new Plasma session if needed
- keep a backup before modifying the configuration

### Package installation errors

- update the package database: `sudo pacman -Sy`
- check the mirror list and package cache
- verify the package exists: `pacman -Ss <name>`
- use a supported repository mirror

### Missing configuration files

```bash
ls ~/.config/kitty
ls ~/.config/fastfetch
ls ~/.config/starship
```

### Restore failures

- confirm the backup folder exists
- compare source and target files
- verify permissions and user ownership
- restore one file at a time

Related links:
- [Arch Wiki](https://wiki.archlinux.org/)
- [KDE documentation](https://develop.kde.org/)
- [Kitty documentation](https://sw.kovidgoyal.net/kitty/)
- [Fastfetch documentation](https://github.com/fastfetch-cli/fastfetch)
- [Starship documentation](https://starship.rs/)

## Roadmap

Planned work:

- document the current desktop setup
- add real screenshots when available
- maintain package lists for the current workstation
- refine the safe Bash scripts
- improve backup and restore notes
- test restoration on a real Arch + KDE installation
- document future theme and panel improvements

## Contributing and license

Suggestions, fixes, and improvements are welcome.

Use a pull request or issue to propose changes, and keep the documentation practical and easy to understand for beginners.

Privacy note: this repository does not track personal usage data. Third-party themes, fonts, wallpapers, icons, and other assets may carry their own licenses and terms. Any such assets should be reviewed before distribution or reuse.

The original repository content is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## Related docs

- [docs/installation.md](docs/installation.md)
- [docs/customization.md](docs/customization.md)
- [docs/troubleshooting.md](docs/troubleshooting.md)
- [kde/themes.md](kde/themes.md)
- [kde/shortcuts.md](kde/shortcuts.md)
- [kde/panels-and-widgets.md](kde/panels-and-widgets.md)
- [kde/settings-backup.md](kde/settings-backup.md)
