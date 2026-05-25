# Fresh Arch Usage

This repo assumes Arch Linux is already installed and a normal user exists.

From a TTY:

```bash
sudo pacman -Syu --needed chezmoi git
chezmoi init --apply <repo-url>
sudo reboot
```

After reboot, log in and start the session:

```bash
Hyprland
```

If SSH authentication is not ready yet, use an HTTPS repo URL for the first
`chezmoi init`.
