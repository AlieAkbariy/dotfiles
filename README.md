# Ali's Arch Hyprland Dotfiles

Chezmoi-managed Arch Linux desktop configuration for a 17-inch 1920x1080 laptop.

This repo bootstraps a fresh Arch TTY into the same Hyprland setup used on the
current machine: Hyprland, Waybar, Wofi, Foot server/client terminal, Fish,
GTK/Qt dark theme, NetworkManager, Bluetooth, clipboard history, screenshots,
lock/idle handling, fonts, and terminal utilities.

## Fresh Arch Install

After installing Arch, creating your user, and logging into a TTY:

```bash
sudo pacman -Syu --needed chezmoi git
chezmoi init --apply git@github.com:AlieAkbariy/dotfiles.git
sudo reboot
```

After reboot, log in and start Hyprland:

```bash
Hyprland
```

If you cloned the repo manually:

```bash
chezmoi init --source ~/.local/share/chezmoi
chezmoi apply
```

## What It Installs

The bootstrap script installs official Arch packages for:

- Hyprland desktop: `hyprland`, `waybar`, `wofi`, `hyprpaper`, `hyprlock`, `hypridle`
- Portals and themes: `xdg-desktop-portal-hyprland`, `xdg-desktop-portal-gtk`, GTK/Qt theme tools
- Terminal and shell: `foot`, `fish`, `eza`, `bat`, `zoxide`, `fzf`, `ripgrep`, `fd`
- Audio/network/Bluetooth: PipeWire, WirePlumber, NetworkManager, BlueZ
- Utilities: screenshots, clipboard history, file manager, fonts, power profiles, UFW

All package installation is in:

```text
.chezmoiscripts/run_onchange_before_00-install-arch-packages.sh.tmpl
```

## Keybinds

- `SUPER+Enter`: open terminal
- `SUPER+D` or `SUPER+Space`: app launcher
- `SUPER+T`: random wallpaper
- `SUPER+L`: lock screen
- `SUPER+CTRL+T`: restart Foot server
- `Print`: area screenshot
- `Shift+Print`: full screenshot
- `SUPER+Shift+E`: power menu

## Update Workflow

On the configured machine:

```bash
chezmoi cd
git status
chezmoi diff
git add .
git commit -m "Update dotfiles"
git push
```

On a new/existing machine:

```bash
chezmoi update
```

## Validate

This repo includes a validation helper that is ignored by chezmoi apply:

```bash
./tools/validate.sh
```

It checks templates, shell syntax, package names, managed targets, and common
secret patterns.

## Secrets

Plain-text SSH password aliases were intentionally not imported.

Keep private shell aliases outside this repo, for example:

```fish
~/.config/fish/conf.d/private-aliases.fish
```

If secrets must live in chezmoi later, use chezmoi encryption rather than
committing plain text.
