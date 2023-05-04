autoload -Uz +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit
# path

if [[ $(arch) == "arm64" ]]; then
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/local/sbin:$PATH"
else
  export PATH="/usr/local/bin:/usr/local/sbin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
fi

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.config/jetbrains:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.asdf/bin:$PATH
export PATH=$HOME/.asdf/shims:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/bin:$PATH
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

function has() {
  if [ -x "$(command -v $1)" ]; then
    return true
  fi
  return false
}

function showpack() {
  jq -r '.scripts | keys[] as $k | "\($k)| \(.[$k])"' package.json | column -t -s "| "
}
 

# global aliases
alias -g ...='../..'
alias -g ....='../../..'

# command aliases
## custom aliases
alias desk='cd ~/Desktop'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias pa='pyenv activate'

alias za="arch -arch arm64e /bin/zsh"
alias zx="arch -arch x86_64 /bin/zsh"

## common aliases
alias l='ls -lFh'
alias ll='ls -l'
if has "exa"; then
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
if has "git"; then
  alias g='git'
  alias ga='git add'
  alias gaa='git add --all'
  alias gb='git branch'
  alias gbd='git branch -d'
  alias gbD='git branch -D'
  alias gcd='git switch $(git_develop_branch)'
  alias gcl='git clone --recursive'
  alias gcm='git switch $(git_main_branch)'
  alias gcmsg='git commit -S -m'
  alias gco='git checkout'
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
fi

## etc aliases
alias saml="AWS_PROFILE=saml"
alias tf="terraform"

# optional aliases
has "exa" && alias ls='exa'
has "bat" && alias cat='bat'

if has "nvim"; then
  export EDITOR='nvim'
  alias vim='nvim'
else
  export EDITOR='vim'
fi

if has "kubectl"; then
  alias k="kubectl"
fi

# initialize things
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt
eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
