# Customization guide

This document explains how to organize a minimal, dual-tone KDE Plasma desktop without over-customizing the system.

## Design goals

- keep the desktop readable and intentional
- use a white or charcoal foundation with grayscale accents
- maintain a consistent palette across KDE, Kitty, and shell prompt
- favor simple panels, clean fonts, and restrained widgets

## Color and theme variants

### Light variant

- background: white
- text: charcoal
- borders: subtle gray
- window chrome: minimal and high contrast

### Dark variant

- background: charcoal
- text: soft white
- borders: muted gray
- widgets: low-noise and consistent

## KDE configuration layers

It helps to distinguish between these categories:

- global theme: comprehensive desktop style
- color scheme: palette used across KDE apps and widgets
- application style: Qt or GTK look for apps
- icon theme: system and application icons
- cursor theme: pointer appearance
- window decoration: resize handles, titlebar, controls

Use System Settings to adjust each layer separately. A global theme alone will not guarantee every application matches the same look.

## Desktop setup checklist

- choose a clean wallpaper
- set a compatible color scheme
- select a readable font family and size
- use a slim panel with only essential widgets
- keep launchers minimal and uncluttered
- enable only the effects you need
- document shortcuts for common actions

## Kitty style

Use a neutral palette and keep the font readable:

```bash
mkdir -p ~/.config/kitty
cp /path/to/Arch-Linux-Dotfiles/configs/kitty/kitty.conf ~/.config/kitty/kitty.conf
```

Recommended settings:

- font size 10-12 for desktop usage
- reduced padding
- grayscale color palette
- no excessive decoration

## Shell prompt style

Starship is an easy way to keep the terminal prompt consistent.

```bash
mkdir -p ~/.config/starship
cp /path/to/Arch-Linux-Dotfiles/configs/starship/starship.toml ~/.config/starship/starship.toml
```

Keep the prompt minimal:

- current directory
- Git branch when applicable
- symbol for command status
- minimal color contrast

## Fastfetch output

Fastfetch is useful for a quick system readout. Keep it focused and avoid exposing personal details.

```bash
cp /path/to/Arch-Linux-Dotfiles/configs/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
fastfetch
```

## Safe customization workflow

1. Review the config file.
2. Copy it to the appropriate user config directory.
3. Open the app and verify the layout.
4. Adjust one setting at a time.
5. Keep a backup before changing major desktop behavior.

## Related documentation

- [installation.md](installation.md)
- [troubleshooting.md](troubleshooting.md)
- [../kde/themes.md](../kde/themes.md)
- [../kde/shortcuts.md](../kde/shortcuts.md)
