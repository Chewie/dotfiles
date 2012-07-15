# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/chewie/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# Aliases
alias ls='ls --color=auto'
alias rat='tmux attach-session'

# Exports
export PROMPT='%n% @%m% [%~% ]$ '
export RPROMT=''
export PAGER='most'
export NNTPSERVER='news.epita.fr'
export PATH="/sbin:$PATH"
export EPITA=1
# export LANG='en_US.utf8'
