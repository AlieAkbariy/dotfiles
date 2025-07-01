# 🏴 Arch Linux Dotfiles

My personal dotfiles for Arch Linux — built for a minimal, fast, and keyboard-focused Wayland desktop environment using **Sway**, **Waybar**, **Foot**, and **Fish**.  
All configurations are managed with [chezmoi](https://www.chezmoi.io/) for easy portability and reproducibility.

---

## 📦 Features

- **Wayland** with [Sway](https://github.com/swaywm/sway)
- **Waybar** styled to match the [Ayu Mirage](https://github.com/ayu-theme) theme
- **Fish shell** with functions, abbreviations, and completions
- **Foot** terminal emulator configuration
- **Neovim** configured as a lightweight IDE
- **Wofi** application launcher
- **Thunar**, **GTK**, **Git**, and more
- Clean, modular, and easy to maintain

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
chezmoi init --apply git@github.com:AlieAkbariy/dotfiles.git
```

Using HTTPS:

```bash
chezmoi init --apply https://github.com/AlieAkbariy/dotfiles.git
```

### 3. Update configs later

```bash
chezmoi update
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