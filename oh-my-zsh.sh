#!/bin/sh

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10

# Install auto-suggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install zsh-history-substring-search plugin
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# Install zsh-syntax-highlighting plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Save zshrc file
ZSHRC=~/.zshrc

# I used this to test the below sed command
# echo "ZSH_THEME=\"random\"" | sed 's/\(ZSH_THEME=\).*/\1"powerlevel10k\/powerlevel10k"/'
# set powerlevel10k as the default theme
sed -i.old 's/\(^ZSH_THEME=\).*/\1"powerlevel10k\/powerlevel10k"/' $ZSHRC

# I used this to test the below sed command
# echo "plugins=()" | sed 's/\(^plugins=\).*/\1\(brew copyfile git history-substring-search kubectl macos sudo web-search zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting\)/'
# set plugins
sed -i.old 's/\(^plugins=\).*/\1\(brew copyfile git history-substring-search kubectl macos sudo web-search zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting\)/' $ZSHRC

echo "Run 'p10k configure' to configure your prompt with powerlevel10k"
