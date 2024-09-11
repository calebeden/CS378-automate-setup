#!/bin/sh

apt-get update
apt-get install -y openjdk-17-jdk maven git wget htop tmux unzip bzip2 zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -) --unattended"
sed -i '/^plugins=(/c\plugins=(copypath git history jsontools web-search zsh-syntax-highlighting zsh-autosuggestions)' ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
chsh -s $(which zsh)
exec zsh
