# Paths
typeset -U path
path=(/sbin $path)
path=(/snap/bin $path)
path=(~/.cargo/bin $path)

if [ -d "$HOME/.asdf" ]; then
    . $HOME/.asdf/asdf.sh
fi
