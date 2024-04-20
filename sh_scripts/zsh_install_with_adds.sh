#!usr/bin/bash

# check credentials in gitconfig
echo "ZSH + OhMyZSH"
sudo apt install -y zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
 nano ~/.zshrc  # add plugin name in raw with plugin = ()
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
nano ~/.zshrc # add plugin name in raw with plugin = ()

