setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY            # append to history file
setopt HIST_NO_STORE             # Don't store history commands

# Uncomment if you want to explicitly set ZDOTDIR (if you do not set it explicitly ZDOTDIR=$HOME)
# export ZDOTDIR=$HOME/.dotfiles/zdotdir

# Add our own functions folder to fpath for Shared Functions
export fpath=($ZDOTDIR/functions $fpath)

# Search through your entire history
# Usage:
#   h foo # search entire history for "foo"
function h() {
    # check if we passed any parameters
    if [ -z "$*" ]; then
        # if no parameters were passed print entire history
        history 1
    else
        # if words were passed use it as a search
        history 1 | egrep --color=auto "$@"
    fi
}

# Interactive history search
# Usage:
#   fh
function fh() {
    eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# Function that will automatically exand your aliases on your current command line after you press space
globalias() {
   zle _expand_alias
   zle expand-word
   zle self-insert
}
zle -N globalias

# space expands all aliases, including global
bindkey -M emacs " " globalias
bindkey -M viins " " globalias

# control-space to make a normal space
bindkey -M emacs "^ " magic-space
bindkey -M viins "^ " magic-space

# normal space during searches
bindkey -M isearch " " magic-space

###
# Prompt configuration
###

# Set custom prompt path
fpath=($ZDOTDIR/prompts $fpath)
# Load prompt command (standard zsh widget) into shell
autoload -Uz promptinit; promptinit
prompt MyPrompt     # Looks for $ZDOTDIR/prompts/prompt_MyPrompt_setup


# Create $ZDOTDIR/zsh.d folder to drop plugins from other plugin managers (e.g. oh-my-zsh, prezto) into.
# source files in $ZDOTDIR/zsh.d
if [[ -d "${ZDOTDIR:-$HOME}"/zsh.d ]]; then
    for ZSH_FILE in $(ls -A "${ZDOTDIR:-$HOME}"/zsh.d/*.zsh); do
        source "${ZSH_FILE}"
    done
fi

###
# Alliases
###
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias c=clear
alias ccat='pygmentize -g'
alias cd..='cd ..'
alias df='df -m'
alias eg='vim ~/.gitconfig'
alias g=git
alias gc='git commit'
alias h=history
alias l=ls
alias ll='ls -la'
alias ls='ls -FG'
alias md='mkdir -p'
alias grep='grep --color=auto'
alias lsd='ls -d */ | sed -Ee 's,/+$,,'' # List only directories (in the current dir)
