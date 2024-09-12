#!/bin/sh
#
# This script must be run as root, since it performs actions which need root permissions, namely apt-get and chsh
# 
# This script should be run via curl:
#   sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/calebeden/CS378-automate-setup/main/run.sh)"
# or via wget:
#   sudo sh -c "$(wget -qO- https://raw.githubusercontent.com/calebeden/CS378-automate-setup/main/run.sh)"
# or via fetch:
#   sudo sh -c "$(fetch -o - https://raw.githubusercontent.com/calebeden/CS378-automate-setup/main/run.sh)"
#
# As an alternative, you can first download the install script and run it afterwards:
#   wget https://raw.githubusercontent.com/calebeden/CS378-automate-setup/main/run.sh
#   sudo ./run.sh

set -e
USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)
apt-get update
apt-get install -y openjdk-17-jdk maven git wget htop tmux unzip bzip2 zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -) --unattended"
git clone https://github.com/zsh-users/zsh-autosuggestions $USER_HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting $USER_HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
wget https://raw.githubusercontent.com/calebeden/CS378-automate-setup/main/.p10k.zsh -O $USER_HOME/.p10k.zsh
wget https://raw.githubusercontent.com/calebeden/CS378-automate-setup/main/.zshrc -O $USER_HOME/.zshrc
# Assuming default $ZSH_CUSTOM - really hard to get this to work automatically due to the nature of interactive shells
wget https://raw.githubusercontent.com/calebeden/CS378-automate-setup/main/aliases.zsh -O $USER_HOME/.oh-my-zsh/custom/aliases.zsh
chsh -s $(which zsh) "$USER"
exec zsh
