# Sourced by EVERY zsh process, including non-interactive ones (scripts,
# editor task runners, cron). Keep this minimal — interactive-only config
# belongs in .zshrc and the files it sources.

# Set PATH, MANPATH, etc., for Homebrew.
[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Make VS Code the default editor.
export EDITOR='code --wait --new-window'
