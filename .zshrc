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
export PROMPT='%F{207}%n% %F{75}@%F{207}%m% %F{75}[%F{214}%~% %F{75}]%F{75}$%f '
export RPROMPT='${vcs_info_msg_0_}'
export PAGER='most'
export NNTPSERVER='news.epita.fr'
export PATH="/sbin:$PATH"
export EDITOR='vim'
export LANG='en_US.UTF-8'

# virtualenvwrapper
export WORKON_HOME=~/Envs

if [ -f /usr/local/bin/virtualenvwrapper.sh ]
then
    source /usr/local/bin/virtualenvwrapper.sh
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# OPAM configuration
. /home/chewie/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
