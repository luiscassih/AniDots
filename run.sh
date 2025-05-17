#!/usr/bin/env bash
set -e

pkgs=(
  #base
  base-devel
  7zip
  unzip
  zsh
  starship
  neovim
  tree-sitter
  tree-sitter-cli

  tmux
  lazygit
  stow
  fzf
  ripgrep
  btop
  tldr

  firefox
  brave-bin
  # windsurf

  # media
  nautilus
  nautilus-open-any-terminal
  loupe # gnome image viewer
  sushi # nautilus image preview
  vlc
  pavucontrol
  vesktop-bin
  yt-dlp

  font-manager
  ttf-font-awesome
  ttf-hack-nerd
  ttf-monofur-nerd
  ttf-victor-mono-nerd
  ttf-roboto-mono-nerd
  ttf-roboto
  noto-fonts
  noto-fonts-cjk

  # hyprland
  wofi
  wl-clipboard
  waybar
  wlogout
  hyprpicker
  # hyprshot
  grimblast-git
  swappy
  swaylock
  hyprpaper

  # dev
  go
  npm
  bun-bin

  # gtk
  catppuccin-gtk-theme-mocha
  nwg-look

  #aur
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


setup_zsh() {
  [[ ! -s "$HOME/.zshrc" ]] && cp $SCRIPT_DIR/config/.zshrc_default $HOME/.zshrc

  # Adds .zshrc_add to the beginning of zshrc
  ZSH_SOURCE_ADD="source $HOME/.config/.zshrc_add"
  grep -qxF "${ZSH_SOURCE_ADD}" ~/.zshrc || sed -i "1i${ZSH_SOURCE_ADD}" ~/.zshrc

  # Adds bin directory to PATH
  ZSH_BIN_EXPORT="export PATH=\"${SCRIPT_DIR}/bin:\$PATH\""
  grep -qxF "${ZSH_BIN_EXPORT}" ~/.zshrc || sed -i "2i${ZSH_BIN_EXPORT}" ~/.zshrc

  # Adds fzf tab completion
  [[ ! -d "$HOME/.config/fzf-tab" ]] && git clone https://github.com/Aloxaf/fzf-tab $HOME/.config/fzf-tab

  [[ "$SHELL" != *"zsh"* ]] && sudo chsh -s /usr/bin/zsh l
}

setup_config
setup_zsh


# setup tmux tpm
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing TPM (Tmux Plugin Manager)..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty

# correct time sync issues with windows
# timedatectl set-local-rtc 1
