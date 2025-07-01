compositor=${1:-'sway'}

for file in "/etc/profile" "$HOME/.profile" "/etc/yprofile" "$HOME/.yprofile"; do
    if [ -f "$file" ]; then
        . "$file"
    fi
done

if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)"
fi
export XDG_SESSION_TYPE=wayland

# if command -v dbus-update-activation-environment >/dev/null; then
#   dbus-update-activation-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=dwl
# fi
# if command -v systemctl >/dev/null; then
#   systemctl --user import-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=dwl
# fi

case "$compositor" in
   "dwl")  XDG_CURRENT_DESKTOP=wlroots XDG_SESSION_DESKTOP=dwl exec /usr/local/bin/dwl -s 'somebar'
   ;;
   "hypr") XDG_CURRENT_DESKTOP=wlroots XDG_SESSION_DESKTOP=Hyprland exec /usr/bin/Hyprland
   ;;
   "sway") exec /usr/bin/sway
   ;;
esac
