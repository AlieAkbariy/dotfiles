# 🏴 Arch Linux Dotfiles

My personal dotfiles for Arch Linux — built for a minimal, fast, and keyboard-focused Wayland desktop environment.  
All configurations are managed with [chezmoi](https://www.chezmoi.io/) for easy portability and reproducibility.

---

## 📦 Features

- **Wayland** with [Hyprland](https://github.com/hyprwm/Hyprland)
- **Waybar** styled to match the [Ayu Mirage](https://github.com/ayu-theme) theme
- **Zsh** with plugins, aliases, and completions
- **Alacritty** and **Kitty** terminal configs
- **Neovim** configured as a lightweight IDE
- **Rofi**, **Thunar**, **GTK**, **Git**, and more
- Minimal, organized, and modular setup

---

## 🚀 Installation

> ⚠️ Make sure you review the dotfiles before applying them.

### 1. Install chezmoi

```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
```

### 2. Initialize chezmoi with this repository

Using SSH:

```bash
chezmoi init --apply git@github.com:your-username/dotfiles.git
```

Using HTTPS:

```bash
chezmoi init --apply https://github.com/your-username/dotfiles.git
```

### 3. Update configs later

```bash
chezmoi update
```

---

## 📁 Configuration Overview

| Path                    | Purpose                  |
|-------------------------|--------------------------|
| `~/.config/hypr/`       | Hyprland window manager  |
| `~/.config/waybar/`     | Waybar status bar        |
| `~/.config/alacritty/`  | Alacritty terminal       |
| `~/.config/nvim/`       | Neovim IDE               |
| `~/.zshrc`              | Zsh shell config         |
| `~/.gitconfig`          | Git global settings      |

---

## 🎨 Theming

This setup follows a dark theme inspired by Ayu Mirage with consistent UI across:

- Terminal
- Waybar
- GTK / Qt apps (via theming)
- Rofi menu

To install the GTK theme:

```bash
yay -S ayu-theme-gtk
```

Then apply it using `lxappearance` or by manually editing:

```ini
# ~/.config/gtk-3.0/settings.ini
[Settings]
gtk-theme-name = Ayu-Mirage
```

---

## 🧠 Philosophy

- Minimalism and clarity
- Keyboard-centric workflows
- Easy to maintain and sync across devices
- Declarative dotfiles with chezmoi

---

## 📸 Screenshots

> *(Add screenshots here to showcase your setup)*

---

## 📝 License

MIT License — feel free to use and adapt.

---

## 💬 Feedback & Contributions

Forks, issues, and PRs are welcome!