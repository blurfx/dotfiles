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

ensure_zshrc_source() {
    local source_line='source "$HOME/.zsh/common.zsh"'
    local zshrc_file="$HOME/.zshrc"

    if ! grep -Fxq "$source_line" "$zshrc_file"; then
        (echo "$source_line"; cat "$zshrc_file") > "$zshrc_file.tmp" && mv "$zshrc_file.tmp" "$zshrc_file"
        echo "Added '$source_line' to the top of $zshrc_file"
    else
        echo "'$source_line' already present in $zshrc_file"
    fi
}

symlink_prompt "$SCRIPT_DIR/.zsh/common.zsh" "$HOME/.zsh/common.zsh" "zsh config"
if [[ $last_answer == "Y" ]]; then
    create_symlink "$SCRIPT_DIR/.zsh_plugins.txt" "$HOME/.zsh_plugins.txt"
    ensure_zshrc_source
fi

symlink_prompt "$SCRIPT_DIR/.config/alacritty" "$HOME/.config/" "alacritty config"

symlink_prompt "$SCRIPT_DIR/.config/ghostty" "$HOME/.config" "ghostty config"

symlink_prompt "$SCRIPT_DIR/.config/nvim" "$HOME/.config" "nvim config"

symlink_prompt "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf" "tmux config"
if [[ $last_answer == "Y" ]]; then
    mkdir -p "$HOME/.tmux"
    create_symlink "$SCRIPT_DIR/.tmux/weather.sh" "$HOME/.tmux/weather.sh"
    create_symlink "$SCRIPT_DIR/.tmux/status-left.sh" "$HOME/.tmux/status-left.sh"
fi

