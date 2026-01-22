#!/bin/sh

# Install oh-my-zsh (skip if already installed)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Install auto-suggestions plugin (skip if exists)
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# Install zsh-history-substring-search plugin (skip if exists)
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-history-substring-search" ]; then
    git clone https://github.com/zsh-users/zsh-history-substring-search "$ZSH_CUSTOM/plugins/zsh-history-substring-search"
fi

# Install zsh-syntax-highlighting plugin (skip if exists)
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# Save zshrc file
ZSHRC=~/.zshrc

# I used this to test the below sed command
# echo "ZSH_THEME=\"random\"" | sed 's/\(ZSH_THEME=\).*/\1""/'
# set empty theme
sed -i.old 's/\(^ZSH_THEME=\).*/\1""/' $ZSHRC

# I used this to test the below sed command
# echo "plugins=()" | sed 's/\(^plugins=\).*/\1\(brew copyfile git history-substring-search kubectl macos sudo web-search zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting\)/'
# set plugins
sed -i.old 's/\(^plugins=\).*/\1\(brew copyfile git history-substring-search kubectl macos sudo web-search zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting\)/' $ZSHRC

grep -qxF 'fpath+=("$(brew --prefix)/share/zsh/site-functions")' ~/.zshrc || echo 'fpath+=("$(brew --prefix)/share/zsh/site-functions")' >> ~/.zshrc
grep -qxF 'autoload -U promptinit; promptinit' ~/.zshrc || echo 'autoload -U promptinit; promptinit' >> ~/.zshrc
grep -qxF 'prompt pure' ~/.zshrc || echo 'prompt pure' >> ~/.zshrc
