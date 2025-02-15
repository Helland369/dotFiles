# Define colors
TIME_COLOR="%F{178}"   # Yellow (E5C07B)
SHELL_COLOR="%F{167}"  # Red (E06C75)
GIT_COLOR="%F{215}"    # Orange (F3C267)
PATH_COLOR="%F{75}"    # Blue (61AFEF)
RESET="%f"             # Reset color


# Load Git info
autoload -Uz vcs_info  

# Enable Git and extra features
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' get-revision true  # Get commit hash
zstyle ':vcs_info:git:*' formats '(%b@%c | %u%m)'  # Branch + commit hash
zstyle ':vcs_info:git:*' actionformats '(%b|%a)'  # Rebase, cherry-pick, etc.

# Define colors
TIME_COLOR="%F{178}"   # Yellow (E5C07B)
SHELL_COLOR="%F{167}"  # Red (E06C75)
GIT_COLOR="%F{215}"    # Orange (F3C267)
PATH_COLOR="%F{75}"    # Blue (61AFEF)
RESET="%f"             # Reset color

# Function to count modified files
GIT_FILES_CHANGED() {
    local changes
    changes=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
    [[ "$changes" -gt 0 ]] && echo "%F{yellow}${changes} files changed%f"
}

# Function to update the prompt dynamically
update_prompt() {
    vcs_info  # Update Git info
    PS1="
${TIME_COLOR}[%D{%H:%M}]${RESET} \
${SHELL_COLOR}❯ ${RESET}%n@%m \
${GIT_COLOR}${vcs_info_msg_0_}$(GIT_FILES_CHANGED)${RESET}
${PATH_COLOR}%~${RESET}
❯ "
}

# Ensure the prompt updates before each command
precmd_functions+=(update_prompt)

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

# set edior
export EDITOR="nvim"

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

# zellij
alias z="zellij"

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
# eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/omp.json)"
# export LIBVIRT_DEFAULT_URI="qemu:///system"
# End of lines added by compinstall

# Use icons or not to use icons ??

# Load Git info
# autoload -Uz vcs_info  
#
# # Enable Git and extra features
# zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:git:*' get-revision true  # Get commit hash
# zstyle ':vcs_info:git:*' formats '(%b@%c | %u%m)'  # Branch + commit hash
# zstyle ':vcs_info:git:*' actionformats '(%b|%a)'  # Rebase, cherry-pick, etc.
#
# # Set colors for Git status (Icons)
# GIT_CLEAN="%F{2}✔"  # Green ✔ when clean
# GIT_MODIFIED="%F{3}󱦹"  # Yellow * when modified
# GIT_UNTRACKED="%F{1}󱀶"  # Red ? when untracked files
# GIT_STAGED="%F{4} "  # Blue + when staged changes
# GIT_STASHED="%F{5}󰜦"  # Purple $ when stash exists
#
# # Function to count modified files with symbols
# GIT_FILES_CHANGED() {
#     local changes
#     changes=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
#     [[ "$changes" -gt 0 ]] && echo "%F{yellow}${changes} files changed%f"
# }
#
# # Function to update the prompt dynamically
# update_prompt() {
#     vcs_info  # Update Git info
#     local git_status=""
#     
#     # Add symbols if there are changes
#     [[ -n "${vcs_info_msg_0_}" ]] && git_status=" ${GIT_COLOR}${vcs_info_msg_0_}"
#     [[ -n "$(git status --porcelain 2>/dev/null | grep '^ M')" ]] && git_status+=" ${GIT_MODIFIED}"
#     [[ -n "$(git status --porcelain 2>/dev/null | grep '^??')" ]] && git_status+=" ${GIT_UNTRACKED}"
#     [[ -n "$(git status --porcelain 2>/dev/null | grep '^A ')" ]] && git_status+=" ${GIT_STAGED}"
#     [[ -n "$(git stash list 2>/dev/null)" ]] && git_status+=" ${GIT_STASHED}"
#
#     PS1="
# ${TIME_COLOR}[%D{%H:%M}]${RESET} \
# ${SHELL_COLOR}❯ ${RESET}%n@%m \
# ${git_status}${RESET}
# ${PATH_COLOR}%~${RESET}
# ❯ "
# }
#
# # Ensure the prompt updates before each command
# precmd_functions+=(update_prompt)
