# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/th/.zshrc'

autoload -Uz compinit
compinit

# onmisharp path
export PATH="$HOME/.dotnet/tools:$PATH"

# alive lsp path
export PATH="$HOME/bin:$PATH"

# set edior
export EDITOR="nvim"

# ls with colours
alias ls="ls --colo
r=auto"

# Chek the weather

wttr() { curl "wttr.in${1:-}" }
wttrv2() { curl "v2.wttr.in${1:-}"}

alias weather="curl wttr.in/Gressvik"
alias weatherv2="curl v2.wttr.in/Gressvik"
alias moon="curl wttr.in/moon"

# nvim vim
alias vim="nvim"

# emacs
alias emc="emacsclient -nw"
alias ema="emacsclient --create-frame"
alias em="emacs -nw"

# dot dot // go back one directory
alias ..="cd .."

# Man pages
#export MANPATH=$(manpath)

# keep pathe afther wuiting yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/omp.json)"
export LIBVIRT_DEFAULT_URI="qemu:///system"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Set up zoxide completion
eval "$(zoxide init zsh)"

# plugins

source /home/th/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  			#https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 						#https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md

## autosuggestion config
bindkey "^[^M" autosuggest-accept

# End of lines added by compinstall
