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

## Chek the weather
alias wttr="curl wttr.in"
alias wttrv2="curl v2.wttr.in"
alias weather="curl wttr.in/ " # /CityName
alias weatherv2="curl v2.wttr.in/ " # /CityName
alias moon="curl wttr.in/moon"

# Oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/omp.json)"
export LIBVIRT_DEFAULT_URI="qemu:///system"
# End of lines added by compinstall
