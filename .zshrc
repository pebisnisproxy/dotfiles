# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time
plugins=(git zsh-autosuggestions zsh-syntax-highlighting you-should-use)

source $ZSH/oh-my-zsh.sh

# User configuration
export GHQ_ROOT="$HOME/workspaces"

# using zoxide
eval "$(zoxide init zsh)"
alias cd='z'

# fnm
FNM_PATH="/Users/sena/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/sena/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi

eval "`fnm env`"

# pnpm
export PNPM_HOME="/Users/sena/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# go
export GO_PATH=$HOME/go
export PATH=$GO_PATH/bin:$PATH

# bun & its completions
[ -s "/Users/sena/.bun/_bun" ] && source "/Users/sena/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# misc aliases
alias vim='nvim'
alias tree='tree -lah --gitignore'

# get machine's ip address
alias ip="ipconfig getifaddr en0"

# edit global zsh configuration
alias zshconfig="vim ~/.zshrc"
# reload zsh configuration
alias zshsource="source ~/.zshrc"
# reload zsh configuration
alias ohmyzsh="cd ~/.oh-my-zsh"

# navigate to global ssh directory
alias sshhome="cd ~/.ssh"
# edit global ssh configuration
alias sshconfig="vim ~/.ssh/config"

# edit global git configuration
alias gitconfig="vim ~/.gitconfig"

# git aliases
alias gits="git status"
alias gitd="git diff"
alias gitl="git lg"
alias gita="git add ."
alias gitc="cz commit"

# load zsh-completions
autoload -U compinit && compinit

# use starship theme (needs to be at the end)
eval "$(starship init zsh)"
