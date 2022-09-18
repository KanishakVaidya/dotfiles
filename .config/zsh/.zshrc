HISTFILE=~/.local/state/zsh/history
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source $HOME/.config/alias.sh

export STARSHIP_CONFIG=~/.config/starship/zsh-prompt.toml
eval "$(starship init zsh)"

