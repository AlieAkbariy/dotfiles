# Arch Hyprland Dotfiles

Minimal Arch Linux dotfiles managed with [chezmoi](https://www.chezmoi.io/).

This setup targets a Wayland desktop built around Hyprland, Waybar, Wofi, Foot,
Fish, NetworkManager, PipeWire, GTK/Qt dark theme, screenshots, clipboard
history, lock/idle tools, fonts, and a small set of terminal utilities.

## Install

From a fresh Arch TTY:

```bash
sudo pacman -Syu --needed chezmoi git
chezmoi init --apply <repo-url>
sudo reboot
```

After reboot:

```bash
Hyprland
```

## Included

- Hyprland desktop config
- Waybar status bar
- Wofi launcher
- Foot terminal with server/client launcher
- Fish shell config
- GTK/Qt dark theme defaults
- NetworkManager and Bluetooth applet setup
- Clipboard history and screenshot scripts
- Lock screen, idle handling, wallpaper switching
- Arch package/bootstrap scripts

## Keybinds

- `SUPER+Enter`: terminal
- `SUPER+D` or `SUPER+Space`: launcher
- `SUPER+T`: change wallpaper
- `SUPER+L`: lock
- `SUPER+CTRL+T`: restart Foot server
- `Print`: area screenshot
- `Shift+Print`: full screenshot
- `SUPER+Shift+E`: power menu

## Update

```bash
chezmoi update
```

## Validate

```bash
./tools/validate.sh
```

## Notes

Review the bootstrap script before applying on a new machine:

```text
.chezmoiscripts/run_onchange_before_00-install-arch-packages.sh.tmpl
```

Secrets are not included. Keep private aliases, keys, tokens, and machine-only
settings out of the public repo or manage them with chezmoi encryption.
