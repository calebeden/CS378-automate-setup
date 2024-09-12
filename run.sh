#!/bin/sh

apt-get update
apt-get install -y openjdk-17-jdk maven git wget htop tmux unzip bzip2 zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -) --unattended"
sed -i '/^plugins=(/c\plugins=(copypath git history jsontools web-search zsh-syntax-highlighting zsh-autosuggestions)' ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i '/^ZSH_THEME="/c\ZSH_THEME="powerlevel10k/powerlevel10k"' ~/.zshrc
cp $(dirname "$0")/p10k.zsh ~/.p10k.zsh
chsh -s $(which zsh)
exec zsh
