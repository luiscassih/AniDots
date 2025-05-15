#!/usr/bin/env bash
set -e

pkgs=(
  #base
  base-devel
  neovim
  tmux
  lazygit
  stow
  fzf
  ripgrep
  wofi
  btop
  waybar
  ttf-hack-nerd
  ttf-monofur-nerd
  ttf-victor-mono-nerd
  ttf-roboto-mono-nerd

  go
  npm

  #aur
  brave-bin
  windsurf
)

STATE_FILE="$HOME/.dotfiles_packages_installed"
SCRIPT_DIR=$(pwd)

if [[ -f "$STATE_FILE" ]]; then
  mapfile -t PREV_PKGS < "$STATE_FILE"
else
  PREV_PKGS=()
fi

is_installed() {
  pacman -Qq "$1" &>/dev/null
}

# sudo pacman -Syu
install_paru() {
  if ! command -v paru &>/dev/null; then
    tmpdir=$(mktemp -d)
    sudo pacman -S --needed base-devel
    git clone https://aur.archlinux.org/paru.git "$tmpdir/paru"
    cd "$tmpdir/paru"
    makepkg -si --noconfirm
    cd "$SCRIPT_DIR"
    rm -rf "$tmpdir"
  fi
}

install_paru

for pkg in "${pkgs[@]}"; do
  if ! is_installed "$pkg"; then
    echo "Installing $pkg..."
    paru -S --needed --noconfirm "${pkg}"
  # else
  #   echo "$pkg is already installed, skipping."
  fi
done

for pkg in "${PREV_PKGS[@]}"; do
  if is_installed "$pkg" && [[ ! " ${pkgs[@]} " =~ " $pkg " ]]; then
    echo "Uninstalling $pkg..."
    paru -Rns --noconfirm "$pkg"
  fi
done

printf "%s\n" "${pkgs[@]}" > "$STATE_FILE"
echo "Packages state file updated at $STATE_FILE"

setup_config() {
  cd $SCRIPT_DIR
  stow -t $HOME/.config config
}

setup_config
