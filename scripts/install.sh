#!/bin/zsh

setup_git() {
    # accept standard input for name and email
    read -p "Enter your name: " name
    read -p "Enter your email: " email
    git config --global user.email "$email"
    git config --global user.name "$name"
}

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
  "oven-sh/bun/bun"
  "starship"
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

install_omz_plugins() {
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
}

xcodetools

install_homebrew

install_brews

install_casks

install_omz_plugins

setup_git

stow .

source ~/.zshrc
