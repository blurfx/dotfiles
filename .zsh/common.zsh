autoload -Uz +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit
# path

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOME/.config/jetbrains:$PATH
export PATH=$HOME/.cargo/bin:$PATH
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
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,,master,trunk}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return
    fi
  done
  echo main
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

# aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

alias desk='cd ~/Desktop'
alias zshrc='vim ~/.zshrc'
alias zshrcc='vim ~/.zsh/common.zsh'
alias vimrc='vim ~/.config/nvim'
alias tmuxconf='vim ~/.tmux.conf'
alias alaconf='vim ~/.config/alacritty/alacritty.toml';
alias pa='pyenv activate'
alias av='source .venv/bin/activate'

alias l='ls -lhF'
alias ll='ls -l'
if has "eza"; then
  alias la='ls -lahF'
#  alias lt='ls -lhF --sort=modified'
else
  alias la='ls -lAhF'
#  alias lt='ls -lthF'
fi
alias grep='grep --color'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

if has "git"; then
  alias g='git'
  alias ga='git add'
  alias gaa='git add --all'
  alias gb='git branch'
  alias gbd='git branch -d'
  alias gbD='git branch -D'
  alias gcane='git commit --amend --no-edit'
  alias gcd='git switch $(git_develop_branch)'
  alias gcl='git clone --recursive'
  alias gcm='git switch $(git_main_branch)'
  alias gcmsg='git commit -S -m'
  alias gcnmsg='git commit --allow-empty-message'
  alias gco='git checkout'
  alias gd='git diff'
  alias gds='git diff --staged'
  alias gf='git fetch'
  alias gl='git pull'
  alias glog='git log --oneline --decorate --graph'
  alias gloga='git log --oneline --decorate --graph --all'
  alias gm='git merge'
  alias gp='git push'
  alias gpup='git push -u'
  alias gpf='git push --force'
  alias gr='git restore'
  alias grs='git restore --staged'
  alias gst='git status'
  alias gsgsd='git stash && git stash drop'
  alias gsw='git switch'
  alias gswc='git switch -c'
  alias gswd='git switch -d'
fi

# npm scripts
insert_npm_script() {
  if [[ ! -f package.json ]]; then
    return 1
  fi
  local script=$(jq -r ".scripts | to_entries[] | \"\(.key) \t \(.value)\"" package.json | column -t -s $'\t' | fzf | awk '{print $1}')
  if [[ -n $script ]]; then
    LBUFFER+="$script"
    zle reset-prompt
  fi
}
# zle -N insert_npm_script
# bindkey -M emacs '^J' insert_npm_script
# bindkey -M vicmd '^J' insert_npm_script
# bindkey -M viins '^J' insert_npm_script
# bindkey '^J' insert_npm_script

## etc aliases
alias tf="terraform"
has "eza" && alias ls='eza'
has "bat" && alias cat='bat'
has "kubectl" && alias k="kubectl"
has "terraform" && alias tf="terraform"

if has "nvim"; then
  export EDITOR='nvim'
  alias vim='nvim'
else
  export EDITOR='vim'
fi

has "zoxide" && eval "$(zoxide init zsh)"
# has "zoxide" && alias cd='z'
export JQ_COLORS="0;33:0;37:0;37:0;37:0;32:1;37:1;37"

# initialize things
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load
antidote bundle <~/.zsh_plugins.txt >~/.zsh_plugins.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

expand_dots() {
  local input="$LBUFFER"
  while [[ $LBUFFER =~ '([^[:space:].]*)(\.{3,})([^[:space:].]*)' ]]; do
    local full_match="${MATCH}"
    local before_dots="${match[1]}"
    local dots_part="${match[2]}"
    local after_dots="${match[3]}"
    local count=${#dots_part}

    if [[ $count -ge 3 ]]; then
      local replacement=""
      for (( i=0; i<count-2; i++ )); do
        replacement+="../"
      done
      replacement+=".."

      local result="$before_dots"
      if [[ -n "$before_dots" && "$before_dots" != */ ]]; then
        result="$result/"
      fi
      result="$result$replacement"
      if [[ -n "$after_dots" ]]; then
        if [[ "$after_dots" != /* ]]; then
          result="$result/$after_dots"
        else
          result="$result$after_dots"
        fi
      fi

      LBUFFER="${LBUFFER/$full_match/$result}"
    else
      break
    fi
  done

  [[ "$input" != "$LBUFFER" ]]
}

expand_dots_on_tab() {
  if expand_dots; then
    zle redisplay
  else
    zle expand-or-complete
  fi
}

zle -N expand_dots_on_tab
bindkey '^I' expand_dots_on_tab

