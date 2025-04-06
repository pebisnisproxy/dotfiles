#!/bin/bash

declare -a brews=(
  "btop"
  "cowsay"
  "fastfetch"
  "fd"
  "fnm"
  "fzf"
  "gh"
  "ghq"
  "lazygit"
  "luarocks"
  "neovim"
  "ripgrep"
  "stow"
  "tree"
  "zoxide"
  "font-hack-nerd-font"
)

declare -a casks=(
  "keycastr"
  "raycast"
)

xcodetools() {
  xcode-select --install
}

install_homebrew() {
  # install homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_brews() {
  for v in "${brews[@]}"; do
    brew install $v
  done
}

install_casks() {
  for v in "${casks[@]}"; do
    brew install --casks $v
  done
}

xcodetools

install_homebrew

install_brews

install_casks

stow .
