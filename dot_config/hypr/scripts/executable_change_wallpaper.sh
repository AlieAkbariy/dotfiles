#!/usr/bin/env bash
set -euo pipefail

wall_dirs=(
  "$HOME/Pictures/wallpapers"
  "$HOME/Pictures/wallpaper"
  "$HOME/pictures/wallpapers"
  "$HOME/pictures/wallpaper"
)
current_link="${XDG_CACHE_HOME:-$HOME/.cache}/current-wallpaper"

notify() {
  command -v notify-send >/dev/null && notify-send -a Hyprland "$1" "$2" >/dev/null 2>&1 || true
}

pick_wallpaper() {
  local requested="${1:-}"

  if [[ -n "$requested" && -f "$requested" ]]; then
    printf '%s\n' "$requested"
    return
  fi

  mapfile -d '' walls < <(
    find "${wall_dirs[@]}" -maxdepth 2 -type f \
      \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) \
      -print0 2>/dev/null | sort -z
  )

  if (( ${#walls[@]} == 0 )); then
    return 1
  fi

  printf '%s\n' "${walls[RANDOM % ${#walls[@]}]}"
}

wallpaper="$(pick_wallpaper "${1:-}")" || {
  notify "Wallpaper" "No images found in Pictures/wallpaper(s)"
  exit 1
}

mkdir -p "$(dirname "$current_link")"
ln -sfn "$wallpaper" "$current_link"

if command -v hyprpaper >/dev/null; then
  if ! pgrep -x hyprpaper >/dev/null 2>&1; then
    hyprpaper >/tmp/hyprpaper.log 2>&1 &
    sleep 0.6
  fi

  if ! hyprctl hyprpaper wallpaper "eDP-1, $wallpaper, cover" >/tmp/hyprpaper-change.log 2>&1; then
    pkill -x hyprpaper 2>/dev/null || true
    sleep 0.2
    hyprpaper >/tmp/hyprpaper.log 2>&1 &
    sleep 0.8
    hyprctl hyprpaper wallpaper "eDP-1, $wallpaper, cover" >>/tmp/hyprpaper-change.log 2>&1
  fi
  notify "Wallpaper" "$(basename "$wallpaper")"
  exit 0
fi

if command -v swww >/dev/null; then
  swww img "$wallpaper" \
    --transition-type fade \
    --transition-duration 0.8 \
    --transition-fps 60
  notify "Wallpaper" "$(basename "$wallpaper")"
  exit 0
fi

notify "Wallpaper" "Install hyprpaper or swww first"
exit 1
