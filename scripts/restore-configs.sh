#!/usr/bin/env bash
set -euo pipefail

if [[ $# -gt 0 ]]; then
  BACKUP_DIR="${1}"
else
  read -r -p "Enter backup directory to restore from: " BACKUP_DIR
fi

if [[ ! -d "${BACKUP_DIR}" ]]; then
  echo "Backup directory not found: ${BACKUP_DIR}" >&2
  exit 1
fi

echo "Backup source: ${BACKUP_DIR}"
echo "Target root: ${HOME}"

declare -a TARGETS=(
  ".config/kdeglobals"
  ".config/kwinrc"
  ".config/plasmarc"
  ".config/plasma-org.kde.plasma.desktop-appletsrc"
  ".config/kscreenlockerrc"
  ".config/kitty/kitty.conf"
  ".config/fastfetch/config.jsonc"
  ".config/starship/starship.toml"
)

read -r -p "Proceed with restore? This may overwrite selected files. [y/N]: " response
case "${response}" in
  y|Y|yes|YES)
    ;;
  *)
    echo "Restore cancelled."
    exit 0
    ;;
esac

for relative_path in "${TARGETS[@]}"; do
  source_file="${BACKUP_DIR}/${relative_path}"
  target_file="${HOME}/${relative_path}"

  if [[ -f "${source_file}" ]]; then
    mkdir -p "$(dirname "${target_file}")"

    if [[ -e "${target_file}" ]]; then
      timestamp="$(date +%Y%m%d-%H%M%S)"
      backup_file="${target_file}.pre-restore-${timestamp}"
      cp -a "${target_file}" "${backup_file}"
      echo "Backed up current file to: ${backup_file}"
    fi

    cp -a "${source_file}" "${target_file}"
    echo "Restored: ${source_file} -> ${target_file}"
  else
    echo "Missing in backup: ${source_file}"
  fi
done

echo "Restore operation finished. Review files after restore."
