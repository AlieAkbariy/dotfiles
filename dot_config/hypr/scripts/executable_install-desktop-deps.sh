#!/usr/bin/env bash
set -euo pipefail

packages=(
  foot
  fish
  hyprlock
  hypridle
  hyprpaper
  hyprpolkitagent
  xdg-desktop-portal-hyprland
  xdg-desktop-portal-gtk
  qt5-wayland
  qt6-wayland
  qt5ct
  qt6ct
  kvantum
  kvantum-qt5
  wl-clipboard
  cliphist
  grim
  slurp
  swappy
  brightnessctl
  pamixer
  playerctl
  pavucontrol
  networkmanager
  network-manager-applet
  bluez
  bluez-utils
  blueman
  mako
  pacman-contrib
  eza
  bat
  dolphin
  kde-cli-tools
  xdg-utils
  papirus-icon-theme
  adw-gtk-theme
  noto-fonts
  noto-fonts-emoji
  ttf-hack-nerd
  ttf-firacode-nerd
  ttf-jetbrains-mono-nerd
  nwg-look
)

sudo pacman -Syu --needed "${packages[@]}"
sudo systemctl enable --now NetworkManager.service
sudo systemctl enable --now bluetooth.service || true
systemctl --user enable --now xdg-desktop-portal.service || true
~/.config/hypr/scripts/app-theme.sh dark || true

printf '\nDesktop dependencies are installed. Log out and back in, or run: hyprctl reload\n'
