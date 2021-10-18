#!/usr/bin/zsh
vared -p '1 for Qtile 2 for Kde ' -c CHOICE
if [[ $CHOICE -eq 1 ]]
then
    startx "$HOME/.xinitrc"
else
    startx "$HOME/.xinitrc-kde"
fi

eval "$(gh completion -s zsh)"
