# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

[[ -f "${HOME}/.z.sh" ]] &&  source $HOME/z.sh

if [[ "$(uname -s)" == "Darwin" ]]; then
  BREW_PREFIX="$(brew --prefix)"
  fpath+=("${BREW_PREFIX}/share/zsh/site-functions")
else
  export ZPLUG_HOME="${HOME}/.zplug"
fi

# Initialize zplug
source $ZPLUG_HOME/init.zsh

# Oh-My-Zsh theme and settings
ZSH_THEME="bira"
ZSH_DISABLE_COMPFIX="true"
DISABLE_AUTO_UPDATE="true"

# Initialize prompt
autoload -U promptinit; promptinit

# Enable autocompletions

[[ -f "${ZSH_CUSTOM}/plugins/zsh-completions/zsh-autocomplete.plugin.zsh" ]] && \
  source "${ZSH_CUSTOM}/plugins/zsh-completions/zsh-autocomplete.plugin.zsh"

autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
[[ "$(date +'%j')" != "$updated_at" ]] && compinit -i || compinit -C -i

# Load complist for better completion
zmodload -i zsh/complist

# History settings
setopt hist_expire_dups_first # Remove the oldest duplicates first when history exceeds its size limit
setopt hist_ignore_dups       # Ignore duplicate commands when adding to the history list
setopt hist_ignore_space      # Ignore commands that start with a space in the history
setopt hist_verify            # Show the command with history expansion to the user before executing it
setopt hist_ignore_all_dups   # Remove all previous duplicates of a command from the history when saving
setopt hist_reduce_blanks     # Remove extra blank spaces from commands in the history
setopt inc_append_history     # Append commands to the history file immediately as they are executed
setopt extended_history       # Save timestamps with each command in the history file
setopt hist_find_no_dups      # Avoid duplicates when searching through history

# Enable direnv integration
eval "$(direnv hook zsh)"

# Convenient directory navigation
setopt auto_cd

# Completion settings
setopt auto_list              # Automatically list choices on ambiguous completion
setopt auto_menu              # Use a menu for completion when multiple choices are available
setopt always_to_end          # Move the cursor to the end of the word on completion
unsetopt correct_all          # Disable automatic correction of all command words

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

plugins=(
  ansible
  argocd
  aws
  colored-man-pages
  colorize
  common-aliases
  cp
  docker
  docker-compose
  git
  git-auto-fetch
  helm
  kubectl
  kubectx
  terraform
  z
  zsh-autosuggestions
  zsh-bat
  zsh-completions
  zsh-syntax-highlighting
  zsh-you-should-use
)

# Source oh-my-zsh
source "$ZSH/oh-my-zsh.sh"

# kubectl completion
source <(kubectl completion zsh)

# Source custom configuration files if they exist
config_files=(~/.exports ~/.aliases ~/.functions.sh)
for config_file in "${config_files[@]}"; do
  [[ -f "$config_file" ]] && source "$config_file"
done

# fzf integration
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# iTerm2 integration
[[ -e "${HOME}/.iterm2_shell_integration.zsh" ]] && [[ "$(uname -s)" == "Darwin" ]] && source "${HOME}/.iterm2_shell_integration.zsh"

