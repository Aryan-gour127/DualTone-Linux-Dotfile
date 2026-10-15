# KDE settings backup

KDE Plasma stores configuration in user-level files in `~/.config`, and these files can vary between versions and hardware setups.

## Safe backup workflow

Use the repository backup script:

```bash
bash scripts/backup-configs.sh
```

The script stores files in a timestamped backup directory and does not replace the entire user configuration tree.

## Common configurations to back up

- `~/.config/kdeglobals`
- `~/.config/kwinrc`
- `~/.config/plasmarc`
- `~/.config/plasma-org.kde.plasma.desktop-appletsrc`
- `~/.config/kscreenlockerrc`
- `~/.config/kitty/kitty.conf`
- `~/.config/starship/starship.toml`
- `~/.config/fastfetch/config.jsonc`

## Restore approach

Restore only the files you need:

```bash
bash scripts/restore-configs.sh
```

Before replacing a file:

- check the source backup path
- confirm the target file
- save a backup of the current file if needed
- restore one file at a time

## Compatibility notes

Plasma versions, widget availability, display settings, and hardware differences can affect compatibility. Keep configuration backups dated and documented so they are easy to recover.

## Related docs

- [themes.md](themes.md)
- [panels-and-widgets.md](panels-and-widgets.md)
