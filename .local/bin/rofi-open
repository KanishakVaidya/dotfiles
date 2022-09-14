#!/bin/bash
xdg-open "$(rg --no-messages --files ~/doc ~/pc ~/pic ~/dwn ~/.config ~/vid \
    -g "!{*.srt,*.rar,*.txt,*.zip,*.nfo}" | rofi -threads 0 \
    -theme-str "#window { width: 1920;}" -location 2 -theme slate.rasi \
    -dmenu -sort -sorting-method fzf -i -p "find")"
