if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# path
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.config/JetBrains:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.asdf/bin:$PATH
export PATH=$HOME/.asdf/shims:$PATH
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# zsh options
HISTSIZE=10000000
SAVEHIST=10000000
setopt SHARE_HISTORY

# git alias helper function
function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return
    fi
  done
  echo master
}

function git_develop_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in dev devel development; do
    if command git show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return
    fi
  done
  echo develop
}

# command aliases
## custom aliases
alias desk='cd ~/Desktop'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias pa='pyenv activate'

## common aliases
alias l='ls -lFh'
alias ll='ls -l'
if [[ exa ]]; then
  alias la='ls -laFh'
  alias lt='ls -lFh --sort=modified'
else
  alias la='ls -lAFh'
  alias lt='ls -ltFh'
fi
alias grep='grep --color'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

## git aliases
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gcd='git switch $(git_develop_branch)'
alias gcl='git clone'
alias gcm='git switch $(git_main_branch)'
alias gcmsg='git commit -S -m'
alias gd='git diff'
alias gds='git diff --staged'
alias gf='git fetch'
alias gl='git pull'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias gm='git merge'
alias gp='git push'
alias gpf='git push --force'
alias gst='git status'
alias gsgsd='git stash && git stash drop'
alias gsw='git switch'
alias gswc='git switch -c'

# optional aliases
[[ exa ]] && alias ls='exa'
[[ bat ]] && alias cat='bat'

if [[ nvim ]]; then
  export EDITOR='nvim'
  alias vim='nvim'
else
  export EDITOR='vim'
fi

# initialize things
source /opt/homebrew/opt/asdf/asdf.sh
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt
eval $(thefuck --alias)
eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
