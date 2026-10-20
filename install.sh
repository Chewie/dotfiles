#! /bin/bash

set -eu

# I can't be arsed to summon the cthulhu pattern to be POSIX, so sue me.
shopt -s dotglob nullglob

# I always run ./install.sh from the dotfiles directory, but just in case...
cd $(dirname $(realpath $0))

# Some programs (looking at you, DMS) pre-populate the xdg config with various
# stuff, which breaks a naive symlink. As such, we first backup real
# directories before symlinking
link() {
    local src=$1
    local dest=$2

    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "Found existing config at $dest, moving it to backup folder"
        mv -v "$dest" "$dest.backup.$(date +%Y%m%d%H%M%S)"
    fi
    ln -sfrnv "$src" "$dest"
}


host=$(uname -n)

# Sometimes, a config needs a local override. For example, my terminal needs a
# different font size depending on the host I'm on.
# Inside each folder is an optional hosts/ folder that contain an override for
# each hostname, e.g. <hostname>.<ext>. Before doing the real install, the
# script checks if an override exists for the current hostname, and symlinks it
# to local.<ext> inside the folder (that symlink is gitignored).
for f in xdg/*/hosts/${host}.* home/*/hosts/${host}.*; do
    # I took a perverse pleasure in writing that one
    # It basically means "$f without the `hosts/` part, and $host becomes local"'
    # e.g. xdg/alacritty/hosts/myhost.toml -> xdg/alacritty/local.toml
    ln -srfnv "$f" "${f%/hosts/*}/local.${f##*/hosts/"$host".}"
done

# stuff in home is not XDG compliant, must be symlinked to $HOME (boooo!)
for f in home/*; do
    link "$f" "$HOME/${f##*/}"
done


# stuff in xdg must be symlinked to XDG_CONFIG_HOME (defaults to ~/.config)
cfg=${XDG_CONFIG_HOME:-~/.config}
mkdir -p "$cfg"
for f in xdg/*; do
    link "$f" "$cfg/${f##*/}"
done
