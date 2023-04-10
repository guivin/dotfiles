# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="bira"
ZSH_DISABLE_COMPFIX="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Enable autocompletions
autoload -Uz compinit

typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ "$(date +'%j')" != "$updated_at" ]; then
  compinit -i
else
  compinit -C -i
fi

# Load complist
zmodload -i zsh/complist

# remove older duplicate entries from history
setopt hist_ignore_all_dups

# remove superfluous blanks from history items
setopt hist_reduce_blanks

# save history entries as soon as they are entered
setopt inc_append_history

# share history between different instances of the shell
setopt share_history

# cd by typing directory name if it's not a command
setopt auto_cd

# automatically list choices on ambiguous completion
setopt auto_list

# automatically use menu completion
setopt auto_menu

# move cursor to end if word had one match
setopt always_to_end

# disable auto correct
unsetopt correct_all

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

plugins=(
  aws
  docker
  docker-compose
  git
  git-auto-fetch
  golang
  kubectl
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

# Source oh-my-zsh
source "$ZSH/oh-my-zsh.sh"

# kubectl completion
source <(kubectl completion zsh)

# Source to exports environment variables
if [[ -f "$HOME/.exports" ]]; then
    source "$HOME/.exports"
fi

# Source aliases
if [[ -f "$HOME/.aliases" ]]; then
    source "$HOME/.aliases"
fi

# Source functions
if [[ -f "$HOME/.functions" ]]; then
    source "$HOME/.functions"
fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

autoload -U promptinit; promptinit

GOOGLE_SDK_DIR="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"

if [[ -d $GOOGLE_SDK_DIR ]]; then
  source "$GOOGLE_SDK_DIR/path.zsh.inc"
  source "$GOOGLE_SDK_DIR/completion.zsh.inc"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

