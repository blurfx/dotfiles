# Open the file ~/.p10k.zsh and copy-paste the prompt_arch and instant_prompt_arch below.
# if you can't find the right place, find the prompt_example and paste it near it.
#
# And add an arch to POWERLEVEL9K_LEFT_PROMPT_ELEMENTS.
# It must be ahead of the prompt_char.
#
# example:
#  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
#    dir
#    ...
#    arch
#    prompt_char
#  )
#

function prompt_arch() {
  if [[ $(arch) == "i386" ]]; then
   p10k segment -t '🐢'
  fi
}

function instant_prompt_arch() {
  prompt_arch
}
