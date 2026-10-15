#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
PACMAN_LIST="${REPO_ROOT}/packages/pacman-packages.txt"
AUR_LIST="${REPO_ROOT}/packages/aur-packages.txt"

if [[ ! -f /etc/os-release ]]; then
  echo "This script expects an Arch Linux system." >&2
  exit 1
fi

if ! grep -qi '^ID=arch' /etc/os-release; then
  echo "This script is intended for Arch Linux only." >&2
  exit 1
fi

if [[ ! -f "${PACMAN_LIST}" ]]; then
  echo "Package list not found: ${PACMAN_LIST}" >&2
  exit 1
fi

if [[ ! -f "${AUR_LIST}" ]]; then
  echo "AUR package list not found: ${AUR_LIST}" >&2
  exit 1
fi

echo "This script will install packages from ${PACMAN_LIST}."
echo "It will not install AUR packages automatically."

echo
printf '%s\n' "Packages to be considered:"
while IFS= read -r line || [[ -n "${line}" ]]; do
  trimmed="${line%%#*}"
  trimmed="${trimmed//[[:space:]]/}"
  if [[ -n "${trimmed}" ]]; then
    echo " - ${trimmed}"
  fi
done < "${PACMAN_LIST}"

echo
read -r -p "Continue with installation? [y/N]: " response
case "${response}" in
  y|Y|yes|YES)
    ;;
  *)
    echo "Installation cancelled."
    exit 0
    ;;
esac

packages=()
while IFS= read -r line || [[ -n "${line}" ]]; do
  trimmed="${line%%#*}"
  trimmed="${trimmed//[[:space:]]/}"
  if [[ -n "${trimmed}" ]]; then
    packages+=("${trimmed}")
  fi
done < "${PACMAN_LIST}"

if [[ ${#packages[@]} -eq 0 ]]; then
  echo "No packages found in ${PACMAN_LIST}."
  exit 0
fi

printf 'Installing %d package(s) from the official repository...\n' "${#packages[@]}"
if ! sudo pacman -S --needed "${packages[@]}"; then
  echo "Package installation failed. Review the list and try again." >&2
  exit 1
fi

echo
printf '%s\n' "AUR software is documented separately in ${AUR_LIST}."
printf '%s\n' "Review that file before using an AUR helper or manual installation."
