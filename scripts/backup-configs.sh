#!/usr/bin/env bash
set -euo pipefail

TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP_ROOT="${1:-${HOME}/.local/share/arch-linux-dotfiles-backups}"
BACKUP_DIR="${BACKUP_ROOT}/${TIMESTAMP}"

mkdir -p "${BACKUP_DIR}"

declare -a TARGETS=(
  "${HOME}/.config/kdeglobals"
  "${HOME}/.config/kwinrc"
  "${HOME}/.config/plasmarc"
  "${HOME}/.config/plasma-org.kde.plasma.desktop-appletsrc"
  "${HOME}/.config/kscreenlockerrc"
  "${HOME}/.config/kitty/kitty.conf"
  "${HOME}/.config/fastfetch/config.jsonc"
  "${HOME}/.config/starship/starship.toml"
)

echo "Creating backup in: ${BACKUP_DIR}"

for source in "${TARGETS[@]}"; do
  if [[ -e "${source}" ]]; then
    relative_path="${source#${HOME}/}"
    dest="${BACKUP_DIR}/${relative_path}"
    mkdir -p "$(dirname "${dest}")"
    cp -a "${source}" "${dest}"
    echo "Backed up: ${source}"
  else
    echo "Missing: ${source}"
  fi
done

echo
printf 'Backup complete. Files are stored in %s\n' "${BACKUP_DIR}"
