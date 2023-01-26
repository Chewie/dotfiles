# The following lines were added by compinstall

autoload -U colors && colors

setopt prompt_subst
setopt glob_dots

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' rehash true
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

# Open command in vim
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

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

npma ()
{
  NPM_ENV=$(npm prefix)
  export NPM_ENV

  _OLD_NPM_PATH="$PATH"
  PATH="$(npm bin):$PATH"
  export PATH
  _OLD_NPM_PS1="$PS1"
  PS1="($(basename $NPM_ENV)) $PS1"
}

npmd ()
{
    if ! [ -z "${_OLD_NPM_PATH+_}" ] ; then
        PATH="$_OLD_NPM_PATH"
        export PATH
        unset _OLD_NPM_PATH
    fi
    if ! [ -z "${_OLD_NPM_PS1+_}" ] ; then
        PS1="$_OLD_NPM_PS1"
        export PS1
        unset _OLD_NPM_PS1
    fi
    unset NPM_ENV
}

# Prompt
export PROMPT='%F{207}%n% %F{75}@%F{207}%m% %F{75}[%F{214}%~% %F{75}]%F{75}$%f '
export RPROMPT='${vcs_info_msg_0_}'

# Aliases
alias ls='ls --color=auto'
alias rat='tmux attach-session'
alias se='sudoedit'
alias ip='ip -c'
alias k='kubectl'
alias mk='microk8s.kubectl'
alias vim='nvim'
