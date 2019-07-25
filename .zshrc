# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"

plugins=(
  git
  git-flow
  zsh-autosuggestions
)

source ~/.bash_profile
source $ZSH/oh-my-zsh.sh

export LANG=ko_kr.UTF-8
[[ $TMUX = "" ]] && export TERM="xterm-256color"

ZSH_THEME="agnoster"
USER=``
HISTSIZE=10000000
SAVEHIST=10000000

alias desk='cd ~/Desktop'
alias g11='g++ -o2 -std=c++11'
alias g17='g++ -o2 -std=c++17'
alias gsgsd="git stash;git stash drop"
alias zshconf="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"

#zplug plugins
source ~/.zplug/init.zsh
zplug "supercrabtree/k"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load # --verbose

if type tmux > /dev/null && ! (( ${+TMUX} )) ; then
    eval "tmux -2"
fi
