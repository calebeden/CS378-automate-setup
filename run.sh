#!/bin/sh
set -e
apt-get update
apt-get install -y openjdk-17-jdk maven git wget htop tmux unzip bzip2 zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -) --unattended"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
wget https://raw.githubusercontent.com/calebeden/CS378-automate-setup/main/.p10k.zsh -O ~/.p10k.zsh
wget https://raw.githubusercontent.com/calebeden/CS378-automate-setup/main/.zshrc -O ~/.zshrc
# Assuming default $ZSH_CUSTOM - really hard to get this to work automatically due to the nature of interactive shells
wget https://raw.githubusercontent.com/calebeden/CS378-automate-setup/main/aliases.zsh -O ~/.oh-my-zsh/custom/aliases.zsh
chsh -s $(which zsh) "$USER"
exec zsh
