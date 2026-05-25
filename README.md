# Ali Arch Hyprland Chezmoi Config

This chezmoi source recreates the Hyprland desktop config from a fresh Arch install.

It installs official Arch packages, fonts, Hyprland tools, portals, audio, network,
Bluetooth, terminal utilities, and then applies the dotfiles.

## Fresh Arch Usage

From a TTY after installing Arch and creating your user:

```bash
sudo pacman -Syu --needed chezmoi git
chezmoi init --apply <your-git-repo-url>
```

If the source is already local:

```bash
chezmoi apply
```

After the first apply, reboot once:

```bash
sudo reboot
```

Then log in and start:

```bash
Hyprland
```

## Keybinds

- `SUPER+Enter`: terminal
- `SUPER+D` or `SUPER+Space`: app launcher
- `SUPER+T`: change wallpaper
- `SUPER+L`: lock
- `Print`: area screenshot
- `Shift+Print`: full screenshot
- `SUPER+Shift+E`: power menu

## Secrets

Plain-text SSH password aliases were not imported.
Keep secrets in a private file, for example:

```fish
~/.config/fish/conf.d/private-aliases.fish
```

Do not commit that file unless it is encrypted.
