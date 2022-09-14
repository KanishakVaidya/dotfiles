#! /bin/bash

if [ -z "$1" ]; then
    ls $HOME/.local/share/AppImages
else
    $HOME/.local/share/AppImages/$1 > /dev/null &
fi
