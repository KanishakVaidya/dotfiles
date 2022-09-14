#! /bin/bash

if [ $# -ne 0 ]
then
    firefox --private-window "https://duckduckgo.com/?t=ffab&q=""$1""&ia=web" > /dev/null&
fi
