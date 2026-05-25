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

write_qt() {
  local scheme="$1"
  local icons="$2"

  mkdir -p "$HOME/.config/qt5ct" "$HOME/.config/qt6ct"
  cat > "$HOME/.config/qt5ct/qt5ct.conf" <<EOF
[Appearance]
color_scheme_path=/usr/share/qt5ct/colors/$scheme.conf
custom_palette=true
icon_theme=$icons
standard_dialogs=default
style=Fusion

[Fonts]
fixed="FiraCode Nerd Font,12,-1,5,50,0,0,0,0,0"
general="Noto Sans,10,-1,5,50,0,0,0,0,0"

[Interface]
activate_item_on_single_click=1
buttonbox_layout=0
cursor_flash_time=1000
dialog_buttons_have_icons=1
double_click_interval=400
gui_effects=@Invalid()
keyboard_scheme=2
menus_have_icons=true
show_shortcuts_in_context_menus=true
stylesheets=@Invalid()
toolbutton_style=4
underline_shortcut=1
wheel_scroll_lines=3
EOF

  cat > "$HOME/.config/qt6ct/qt6ct.conf" <<EOF
[Appearance]
color_scheme_path=/usr/share/qt6ct/colors/$scheme.conf
custom_palette=true
icon_theme=$icons
standard_dialogs=default
style=Fusion

[Fonts]
fixed="FiraCode Nerd Font,12,-1,5,50,0,0,0,0,0"
general="Noto Sans,10,-1,5,50,0,0,0,0,0"

[Interface]
activate_item_on_single_click=1
buttonbox_layout=0
cursor_flash_time=1000
dialog_buttons_have_icons=1
double_click_interval=400
gui_effects=@Invalid()
keyboard_scheme=2
menus_have_icons=true
show_shortcuts_in_context_menus=true
stylesheets=@Invalid()
toolbutton_style=4
underline_shortcut=1
wheel_scroll_lines=3
EOF
}

case "$mode" in
  dark)
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark 2>/dev/null || true
    gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-dark 2>/dev/null || true
    gsettings set org.gnome.desktop.interface icon-theme Adwaita 2>/dev/null || true
    write_gtk "adw-gtk3-dark" "Adwaita" "1"
    write_qt "darker" "Adwaita"
    notify "Dark mode" "New apps will prefer dark colors"
    ;;
  light)
    gsettings set org.gnome.desktop.interface color-scheme default 2>/dev/null || true
    gsettings set org.gnome.desktop.interface gtk-theme Adwaita 2>/dev/null || true
    gsettings set org.gnome.desktop.interface icon-theme Adwaita 2>/dev/null || true
    write_gtk "Adwaita" "Adwaita" "0"
    write_qt "airy" "Adwaita"
    notify "Light mode" "New apps will prefer light colors"
    ;;
  *)
    echo "usage: app-theme.sh [dark|light|toggle]" >&2
    exit 2
    ;;
esac
