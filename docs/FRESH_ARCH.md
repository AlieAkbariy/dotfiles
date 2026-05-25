# Fresh Arch Notes

This repo assumes Arch is already installed and you can log in as your normal
user from a TTY.

Minimum first step:

```bash
sudo pacman -Syu --needed chezmoi git
chezmoi init --apply git@github.com:AlieAkbariy/dotfiles.git
```

The first apply installs packages and enables services. Reboot after it finishes:

```bash
sudo reboot
```

Then run:

```bash
Hyprland
```

If SSH GitHub auth is not ready yet, use HTTPS for the initial clone:

```bash
chezmoi init --apply https://github.com/AlieAkbariy/dotfiles.git
```
