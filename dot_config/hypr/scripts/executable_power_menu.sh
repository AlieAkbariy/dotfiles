#!/usr/bin/env bash
set -euo pipefail

choice="$(
  printf '%s\n' Lock Suspend Logout Reboot Shutdown |
    wofi --dmenu --prompt Power --width 280 --height 250 --lines 5
)"

case "$choice" in
  Lock)
    pidof hyprlock >/dev/null || hyprlock
    ;;
  Suspend)
    systemctl suspend
    ;;
  Logout)
    hyprctl dispatch exit
    ;;
  Reboot)
    systemctl reboot
    ;;
  Shutdown)
    systemctl poweroff
    ;;
esac
