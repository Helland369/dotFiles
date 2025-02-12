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

# ls with colours
alias ls="ls --color=auto"

# Chek the weather

wttr() { curl "wttr.in${1:-}" }
wttrv2() { curl "v2.wttr.in${1:-}"}

alias weather="curl wttr.in/Gressvik"
alias weatherv2="curl v2.wttr.in/Gressvik"
alias moon="curl wttr.in/moon"

# nvim vim
alias vim="nvim"

# dot dot // go back one directory
alias ..="cd .."

# Man pages
export MANPATH=$(manpath)

# Oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/omp.json)"
export LIBVIRT_DEFAULT_URI="qemu:///system"
# End of lines added by compinstall
