# The following lines were added by compinstall

autoload -U colors && colors

setopt prompt_subst
setopt glob_dots

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

# VCS Support
autoload -Uz vcs_info

zstyle ':vcs_info:*' actionformats \
    '%F{14}[%F{11}%b%F{11}|%F{9}%a%F{11}]%f'
zstyle ':vcs_info:*' formats \
    '%F{14}[%F{11}%b%F{14}]%f'
zstyle ':vcs_info:*' enable git hg

precmd ()
{
    vcs_info
}


# Aliases
alias ls='ls --color=auto'
alias rat='tmux attach-session'
alias se='sudoedit'

# Exports
export PROMPT='%F{12}%n% %F{75}@%F{12}%m% %F{75}[%F{214}%~% %F{75}]%F{75}$%f '
export RPROMPT='${vcs_info_msg_0_}'
export PAGER='most'
export NNTPSERVER='news.epita.fr'
export PATH="/sbin:$PATH"
export EDITOR='vim'
