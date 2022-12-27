# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/bin/sh

# Build ~/.zsh_plugins.zsh from ~/.zsh_plugins.txt unless the former is newer.
if [[ ! ${ZDOTDIR:-~}/.zsh_plugins.zsh -nt ${ZDOTDIR:-~}/.zsh_plugins.txt ]]; then
  # Clone antidote if it's missing.
  if [[ ! -e ~/.antidote ]]; then
    git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
  fi
  # Build ~/.zsh_plugins.txt in a subshell.
  (
    source ${ZDOTDIR:-~}/.antidote/antidote.zsh
    antidote bundle <${ZDOTDIR:-~}/.zsh_plugins.txt >${ZDOTDIR:-~}/.zsh_plugins.zsh
  )
fi

antidote_dir=${ZDOTDIR:-~}/.antidote
plugins_file=${ZDOTDIR:-~}/.zsh_plugins.txt
static_file=${ZDOTDIR:-~}/.zsh_plugins.zsh

source $HOME/.zshenv
source ${ZDOTDIR:-~}/.zsh_plugins.zsh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

autoload -Uz promptinit && promptinit && prompt powerlevel10k

# Enable the "new" completion system (compsys).
autoload -Uz compinit
compinit
if [[ ! ${ZDOTDIR:-~}/.zcompdump.zwc -nt ${ZDOTDIR:-~}/.zcompdump ]]; then
  zcompile -R -- ${ZDOTDIR:-~}/.zcompdump.zwc ${ZDOTDIR:-~}/.zcompdump
fi

xset r rate 210 40



