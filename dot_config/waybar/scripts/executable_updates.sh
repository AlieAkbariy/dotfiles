#!/usr/bin/env bash
# Lightweight package update checker for Waybar.

set -u

declare -i pacman_count=0
declare -i aur_count=0
declare -a tooltip_lines=()

# Collect pacman updates if the helper exists.
if command -v checkupdates &>/dev/null; then
  pacman_output="$(checkupdates 2>/dev/null || true)"
  if [[ -n "${pacman_output// }" ]]; then
    pacman_count=$(printf '%s\n' "$pacman_output" | sed '/^\s*$/d' | wc -l)
    pacman_preview="$(
      printf '%s\n' "$pacman_output" | cut -d' ' -f1 | head -n 5 | paste -sd ', ' -
    )"
    tooltip_lines+=("pacman (${pacman_count}): ${pacman_preview}")
  fi
fi

# Determine which AUR helper to use, preferring paru over yay.
aur_cmd=""
if command -v paru &>/dev/null; then
  aur_cmd="paru -Qua --color never"
elif command -v yay &>/dev/null; then
  aur_cmd="yay -Qua --color never"
fi

if [[ -n "$aur_cmd" ]]; then
  aur_output="$($aur_cmd 2>/dev/null || true)"
  if [[ -n "${aur_output// }" ]]; then
    aur_count=$(printf '%s\n' "$aur_output" | sed '/^\s*$/d' | wc -l)
    aur_preview="$(
      printf '%s\n' "$aur_output" | cut -d' ' -f1 | head -n 5 | paste -sd ', ' -
    )"
    tooltip_lines+=("aur (${aur_count}): ${aur_preview}")
  fi
fi

total=$((pacman_count + aur_count))

if (( total == 0 )); then
  tooltip="System up to date"
else
  tooltip="$(printf '%s\n' "${tooltip_lines[@]}")"
fi

if (( total == 0 )); then
  state="none"
  icon=""
elif (( total < 10 )); then
  state="few"
  icon=""
else
  state="many"
  icon=""
fi

# Escape newlines for JSON output.
tooltip=${tooltip//$'\n'/\\n}

printf '{"text":"%s %s","tooltip":"%s","class":"%s"}\n' "$icon" "$total" "$tooltip" "$state"
