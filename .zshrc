# Change bindkeys to vim
bindkey -v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

setopt prompt_subst

# Aliases
alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -lAh --color=auto'
alias llh='ls -lAht --color=auto | head -n 10'
alias grep='grep --color=auto'
alias ec="$EDITOR $HOME/.zshrc" # edit .zshrc
alias sc="source $HOME/.zshrc"  # reload zsh configuration
alias icloud='cd ~/Library/Mobile\ Documents/'
alias ashell='cd ~/Library/Mobile\ Documents/iCloud~AsheKube~app~a-Shell/Documents'

# Aliases for file handling
alias crp='realpath . | pbcopy'

# Keep 5000 lines of history within the shell and save it to ~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
HISTORY_IGNORE="(ls|cd|pwd|exit|cd ..|source ~/.zshrc)"

# Zshbindkey -v Autocompletion
autoload -U compinit; compinit

# Git support

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info; }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' (%s)─[%b]%u%c'
zstyle ':vcs_info:git:*' actionformats ' (%s)─[%b|%a]%u%c'
zstyle ':vcs_info:git:*' stagedstr '─S'
zstyle ':vcs_info:git:*' unstagedstr '─U'
zstyle ':vcs_info:git:*' check-for-staged-changes true

RPROMPT='%(?.. %? %B%F{red}⨯%f%b)%(1j. %j %B%F{yellow}⚙%f%b.)${vcs_info_msg_0_}'

# Fixing PROMPT start on a new line
PROMPT=$'%F{%(#.blue.green)}┌──(%f%B%F{%(#.red.blue)}%n%f%b@%B%F{%(#.red.blue)}%m%f%b%F{%(#.blue.green)})─[%f%B%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}]\n└─%f%(#.%F{red}#.%F{blue}$)%f '

# My personal PATH
# export PATH = /usr/local/Cellar/git/2.37.1/bin/git:$PATH

# Syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Fzf keybinds for macOS - obsolete. Key binding are stored in a .fzf.zsh file
# if [[ "$OSTYPE" == "darwin"* ]]; then
# . /usr/local/Cellar/fzf/0.33.0/shell/key-bindings.zsh
# fi
export PATH="/usr/local/sbin:$PATH"

# Load Angular CLI autocompletion.
source <(ng completion script)

# Rclone autocomplete
source ~/Coding/rclone/rclone_autocomplete
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
