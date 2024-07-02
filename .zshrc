# My .zshrc
# I added some parts from https://wiki.debian.org/Zsh

# Set path if required
#export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH

# Aliases
alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -lAh --color=auto'
alias llh='ls -lAht --color=auto | head -n 10'
alias grep='grep --color=auto'
alias ec="$EDITOR $HOME/.zshrc" # edit .zshrc
alias sc="source $HOME/.zshrc"  # reload zsh configuration

# Change bindkeys to Vim
bindkey -v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

setopt prompt_subst


# Keep 5000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
HISTORY_IGNORE="(ls|cd|pwd|exit|cd ..|source ~/.zshrc)"

# Zsh autocompletion
 autoload -U compinit; compinit

# Git support <- THE BEST PART

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info; }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' (%s)─[%b]%u%c'
zstyle ':vcs_info:git:*' actionformats ' (%s)─[%b|%a]%u%c'
zstyle ':vcs_info:git:*' stagedstr '─S'
zstyle ':vcs_info:git:*' unstagedstr '─U'
zstyle ':vcs_info:git:*' check-for-staged-changes true

# Making a custom PROMPT line - macOS compatible
RPROMPT='%(?.. %? %B%F{red}⨯%f%b)%(1j. %j %B%F{yellow}⚙%f%b.)${vcs_info_msg_0_}'

# Fixing PROMPT to start on a new line - macOS compatible
PROMPT=$'%F{blue}┌──(%B%F{12}%n@%m%f%b%F{blue})─[%f%F{15}%(6~.%-1~/…/%4~.%5~)%f%F{blue}]\n%F{blue}└─%f%B%F{22}%(#.%F{red}#.%F{blue}$)%f%b '

# My personal PATH
# export PATH = /usr/local/Cellar/git/2.37.1/bin/git:$PATH

# Syntax highlighting <- SECOND BEST PART
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf keybindings for zsh copied from examples into a custom dir
. ~/.fzf/key-bindings.zsh

# fasd basic full setup. If it gets slow, it can be tailored
eval "$(fasd --init auto)"

# autojump sourcing
. /usr/share/autojump/autojump.sh 

# >>>> Vagrant command completion (start)
fpath=(/usr/share/rubygems-integration/all/gems/vagrant-2.2.14/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)
