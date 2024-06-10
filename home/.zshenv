# Paths
typeset -U path
path=(/sbin $path)
path=(/snap/bin $path)
path=(~/.cargo/bin $path)
path=(~/.krew/bin $path)
path=(~/.local/bin $path)
path=(~/.arkade/bin $path)

# asdf
export ASDF_GOLANG_MOD_VERSION_ENABLED=true
if [ -d "$HOME/.asdf" ]; then
    . $HOME/.asdf/asdf.sh
fi

# 1password cli plugins
if [ -f "$HOME/.config/op/plugins.sh" ]; then
    source $HOME/.config/op/plugins.sh
fi

if command -v nvim &> /dev/null; then
    export EDITOR='nvim'
else
    export EDITOR='vim'
fi

export PAGER='most'
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
