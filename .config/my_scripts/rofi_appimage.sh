#! /bin/bash

if [ -z "$1" ]; then
    ls $HOME/.app/
else
    $HOME/.app/$1 > /dev/null &
fi
