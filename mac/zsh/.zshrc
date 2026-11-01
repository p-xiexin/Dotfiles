

# Terminal appearance: Starship prompt, history suggestions, syntax highlighting.
if [[ -x /opt/homebrew/bin/starship ]]; then
    eval "$(/opt/homebrew/bin/starship init zsh)"
fi

# Tab completion: match file and command names regardless of case.
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
[[ -r /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting must be loaded after other plugins.
[[ -r /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
