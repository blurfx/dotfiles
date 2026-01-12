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

    if prompt "Do you want to create a symlink for $description?"; then
        mkdir -p "$(dirname "$target")"
        create_symlink "$source" "$target"
    fi
    last_answer=$answer
}

prompt() {
    read -p "$1 (Y/n): " answer
    if [[ $answer == "Y" || $answer == "y" || $answer == "" ]]; then
        return 0
    else
        return 1
    fi
}

# chec brew is installed, if not ask to install it
if ! command -v brew &> /dev/null; then
    if prompt "Homebrew is not installed. Do you want to install it?"; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
fi

# if homebrew is installed, ask to install packages with Brewfile
if command -v brew &> /dev/null; then
    if prompt "Do you want to install packages with Brewfile?"; then
        brew bundle --file="$SCRIPT_DIR/Brewfile"
    fi
fi

# ask install packages with Brewfile

ensure_zshrc_source() {
    local source_line='source "$HOME/.zsh/common.zsh"'
    local zshrc_file="$HOME/.zshrc"

    # if .zshrc doesn't exist, create it
    if [[ ! -f "$zshrc_file" ]]; then
        echo "Creating $zshrc_file"
        touch "$zshrc_file"
    fi
    
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

symlink_prompt "$SCRIPT_DIR/.config/nvim" "$HOME/.config" "nvim config"

symlink_prompt "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf" "tmux config"
if [[ $last_answer == "Y" ]]; then
    mkdir -p "$HOME/.tmux"
    create_symlink "$SCRIPT_DIR/.tmux/weather.sh" "$HOME/.tmux/weather.sh"
    create_symlink "$SCRIPT_DIR/.tmux/status-left.sh" "$HOME/.tmux/status-left.sh"
fi

symlink_prompt "$SCRIPT_DIR/.config/zed/keymap.json" "$HOME/.config/zed/keymap.json" "zed keymap"
