#/bin/sh
mkdir -p ~/.config
mkdir -p ~/.tmux
ln -s $(pwd)/../.tmux.conf ~/.tmux.conf || true
ln -s $(pwd)/../.tmux/weather.sh ~/.tmux/weather.sh || true
