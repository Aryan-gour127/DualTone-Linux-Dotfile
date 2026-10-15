# Troubleshooting guide

This document covers common issues encountered when configuring Arch Linux + KDE Plasma with a minimal dotfiles workflow.

## Themes not appearing

Possible checks:

- verify the theme is installed correctly
- review the selected global theme in System Settings
- re-open the app after switching themes
- inspect app-specific GTK or Qt overrides

## Icons or cursors are not changing

Try:

```bash
ls ~/.local/share/icons
ls /usr/share/icons
ls ~/.icons
```

Then reapply the icon or cursor theme in KDE settings. Some apps can ignore the global desktop settings and keep their own theming.

## Kitty or Starship commands are not found

Check the PATH and shell config:

```bash
echo "$PATH"
which kitty
which starship
which fastfetch
```

If needed, verify that the tool is installed and that your shell init file includes the correct command.

## Shell initialization problems

For Bash:

```bash
cat ~/.bashrc
```

For Zsh:

```bash
cat ~/.zshrc
```

For Starship:

```bash
echo 'eval "$(starship init bash)"' >> ~/.bashrc
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
```

## KDE settings appear broken

- restore a known-good backup
- compare current config files with a previous version
- disable recent effects or custom themes
- test a clean Plasma session if needed

## Package installation issues

```bash
sudo pacman -Sy
pacman -Ss <package-name>
```

If a package cannot be found, check the mirror configuration and repository status.

## Missing config files

```bash
ls ~/.config/kitty
ls ~/.config/fastfetch
ls ~/.config/starship
```

If files are missing, copy them from the repository again or create the expected directories.

## Restore failures

Common causes:

- wrong backup source path
- missing permissions
- target file still in use
- partial restore of an unrelated directory

Always restore one file at a time and verify the result before continuing.

## Useful references

- [Arch Wiki](https://wiki.archlinux.org/)
- [KDE documentation](https://develop.kde.org/)
- [Kitty docs](https://sw.kovidgoyal.net/kitty/)
- [Fastfetch repository](https://github.com/fastfetch-cli/fastfetch)
- [Starship docs](https://starship.rs/)

## Related docs

- [installation.md](installation.md)
- [customization.md](customization.md)
