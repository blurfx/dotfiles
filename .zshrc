if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.config/JetBrains:$PATH
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

export LANG=ko_KR.UTF-8

# oh-my-zsh configs
ZSH_THEME="powerlevel10k/powerlevel10k"
USER=``
HISTSIZE=10000000
SAVEHIST=10000000

alias desk='cd ~/Desktop'
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias pa="pyenv activate"
alias gsgsd="git stash && git stash drop"
alias gcmsg="git commit -S -m"

# use nvim if its installed
if type nvim >> /dev/null; then
    export EDITOR="nvim"
    alias vim="nvim"
else
    export EDITOR="vim"
fi

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export ZPLUG_HOME=/usr/local/opt/zplug
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

## run tmux when shell started
# if type tmux > /dev/null && ! (( ${+TMUX} )) ; then
#     eval "tmux -2"
# fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# export GPG_TTY=$(tty)

