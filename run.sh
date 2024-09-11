#!/bin/sh

apt-get update
apt-get install openjdk-17-jdk maven git wget htop tmux unzip bzip2 zsh
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
sed -i '/plugins=(/c\plugins=(copypath git history jsontools web-search zsh-syntax-highlighting zsh-autosuggestions)' ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
exec zsh
