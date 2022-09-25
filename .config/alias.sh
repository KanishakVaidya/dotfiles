############################
# xdg-ninja specifications #
############################
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# $HOME/.bash_history
export HISTFILE="${XDG_STATE_HOME}/bash/history"

# $HOME/.nv
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"

# $HOME/.gnupg
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# $HOME/.gtkrc-2.0
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

# $HOME/.icons
# If there are cursor themes installed in _${XDG_DATA_HOME}/icons_, it may be necessary to add the path to XCURSOR_PATH.
export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons

# $HOME/.lesshst
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# $HOME/.python_history
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"

# $HOME/.texlive/texmf-var
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"

# # $HOME/.Xauthority
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

# $HOME/.histfile
export HISTFILE="$XDG_STATE_HOME/zsh/history"

# $HOME/.zshrc
# this line is added in /etc/zsh/zshenv
# export ZDOTDIR="$HOME"/.config/zsh

export PATH=$HOME/.local/bin:$PATH
export NOTES_DIR=$HOME/doc/notes

############################
####### ALIASES ############
############################

alias ls="exa --color=auto"
alias lsa="exa -a --color=auto"
alias ll="exa -lh --color=auto"
alias lla="exa -lha --color=auto"
alias vim="nvim"
alias cp="cp -i"                          # confirm before overwriting something
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias btop='btop --utf-force'
alias cmatrix='cmatrix -ba'

# GIT ALIASES
alias .git='/usr/bin/git --git-dir=$HOME/.config/my_dotfiles --work-tree=$HOME'
alias .gitadd=".git add \$(.git status | awk '/modified:/{print \$2}' | fzf --multi --preview 'git --git-dir=$HOME/.config/my_dotfiles --work-tree=$HOME diff {}')"

# fuzzy-search through all available packages
# with package info shown in a preview window
# and then install selected packages
alias pacs="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' --preview-window 75% | xargs -ro sudo pacman -S"

# List all your installed packages
# and then remove selected packages
alias pacr="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' --preview-window 75% | xargs -ro sudo pacman -Rns"

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

pfetch
