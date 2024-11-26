#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
last_answer="n"

create_symlink() {
    local source=$1
    local target=$2

    # Create the symlink
    ln -sf "$source" "$target"
    echo "Symlink created: $target -> $source"
}

symlink_prompt() {
    local source=$1
    local target=$2
    local description=$3

    read -p "Do you want to create a symlink for $description? (Y/n): " answer
    if [[ $answer == "Y" || $answer == "y" || $answer == "" ]]; then
        mkdir -p "$(dirname "$target")"
        create_symlink "$source" "$target"
    fi
    last_answer=$answer
}

symlink_prompt "$SCRIPT_DIR/.zsh/common.zsh" "$HOME/.zsh/common.zsh" "zsh config"
if [[ $last_answer == "Y" ]]; then
    create_symlink "$SCRIPT_DIR/.zsh_plugins.txt" "$HOME/.zsh_plugins.txt"
fi

symlink_prompt "$SCRIPT_DIR/.config/alacritty" "$HOME/.config/alacritty" "alacritty config"

symlink_prompt "$SCRIPT_DIR/.config/nvim" "$HOME/.config/nvim" "nvim config"

symlink_prompt "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf" "tmux config"
if [[ $last_answer == "Y" ]]; then
    create_symlink "$SCRIPT_DIR/.tmux/weather.sh" "$HOME/.tmux/weather.sh"
    create_symlink "$SCRIPT_DIR/.tmux/status-left.sh" "$HOME/.tmux/status-left.sh"
fi

