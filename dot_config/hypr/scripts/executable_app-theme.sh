#!/usr/bin/env bash
set -euo pipefail

mode="${1:-dark}"

current_mode() {
  gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null | tr -d "'" || printf 'default'
}

if [[ "$mode" == "toggle" ]]; then
  if [[ "$(current_mode)" == "prefer-dark" ]]; then
    mode="light"
  else
    mode="dark"
  fi
fi

notify() {
  command -v notify-send >/dev/null && notify-send -a Theme "$1" "$2" >/dev/null 2>&1 || true
}

write_gtk() {
  local theme="$1"
  local icons="$2"
  local prefer_dark="$3"

  mkdir -p "$HOME/.config/gtk-3.0" "$HOME/.config/gtk-4.0"
  for file in "$HOME/.config/gtk-3.0/settings.ini" "$HOME/.config/gtk-4.0/settings.ini"; do
    cat > "$file" <<EOF
[Settings]
gtk-theme-name=$theme
gtk-icon-theme-name=$icons
gtk-font-name=Noto Sans 10
gtk-cursor-theme-size=24
gtk-application-prefer-dark-theme=$prefer_dark
EOF
  done
}

write_kde() {
  local color_scheme="$1"
  local scheme_name="$2"
  local icons="$3"
  local look_and_feel="$4"

  mkdir -p "$HOME/.config"
  cat > "$HOME/.config/kdeglobals" <<EOF
[General]
ColorScheme=$color_scheme
Name=$scheme_name
fixed="FiraCode Nerd Font,12,-1,5,50,0,0,0,0,0"
font="Noto Sans,10,-1,5,50,0,0,0,0,0"

[Icons]
Theme=$icons

[KDE]
LookAndFeelPackage=$look_and_feel
SingleClick=false
EOF
}

case "$mode" in
  dark)
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark 2>/dev/null || true
    gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-dark 2>/dev/null || true
    gsettings set org.gnome.desktop.interface icon-theme Adwaita 2>/dev/null || true
    write_gtk "adw-gtk3-dark" "Adwaita" "1"
    write_kde "BreezeDark" "Breeze Dark" "breeze-dark" "org.kde.breezedark.desktop"
    notify "Dark mode" "New apps will prefer dark colors"
    ;;
  light)
    gsettings set org.gnome.desktop.interface color-scheme default 2>/dev/null || true
    gsettings set org.gnome.desktop.interface gtk-theme Adwaita 2>/dev/null || true
    gsettings set org.gnome.desktop.interface icon-theme Adwaita 2>/dev/null || true
    write_gtk "Adwaita" "Adwaita" "0"
    write_kde "BreezeLight" "Breeze Light" "breeze" "org.kde.breeze.desktop"
    notify "Light mode" "New apps will prefer light colors"
    ;;
  *)
    echo "usage: app-theme.sh [dark|light|toggle]" >&2
    exit 2
    ;;
esac
