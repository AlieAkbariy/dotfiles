#!/usr/bin/env bash
set -euo pipefail

mode="${1:-area}"
dir="$HOME/Pictures/Screenshots"
file="$dir/Screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"

notify() {
  command -v notify-send >/dev/null && notify-send -a Screenshot "$1" "$2" || true
}

need() {
  if ! command -v "$1" >/dev/null; then
    notify "Missing dependency" "Install $1"
    exit 1
  fi
}

copy_file() {
  command -v wl-copy >/dev/null && wl-copy < "$1" || true
}

mkdir -p "$dir"
need grim

case "$mode" in
  full)
    grim "$file"
    copy_file "$file"
    notify "Saved and copied" "$file"
    ;;
  area)
    need slurp
    region="$(slurp)" || exit 0
    [[ -n "$region" ]] || exit 0
    grim -g "$region" "$file"
    copy_file "$file"
    notify "Saved and copied" "$file"
    ;;
  area-copy)
    need slurp
    need wl-copy
    region="$(slurp)" || exit 0
    [[ -n "$region" ]] || exit 0
    grim -g "$region" - | wl-copy
    notify "Copied" "Area screenshot copied to clipboard"
    ;;
  area-edit)
    need slurp
    region="$(slurp)" || exit 0
    [[ -n "$region" ]] || exit 0
    grim -g "$region" "$file"
    if command -v swappy >/dev/null; then
      swappy -f "$file"
    else
      copy_file "$file"
      notify "Saved and copied" "$file"
    fi
    ;;
  *)
    echo "usage: screenshot.sh [full|area|area-copy|area-edit]" >&2
    exit 2
    ;;
esac
