#!/bin/bash

# Fedora install
set -e

log "DNF upgrade"
sudo dnf update -y

log "Add RPM Fusion"
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

log "Add another repos"
sudo dnf install fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome

log "Add docker repo"
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

log "Install via DNF"
sudo dnf install -y pass vim tmux libheif-freeworld  libheif-tools \
    zsh python3-pip python3-virtualenv vlc google-chrome-stable

log "VS Code"
curl -J -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-x64" -o "${TMP_DIR}/vscode.rpm"
sudo rpm -i "${TMP_DIR}/vscode.rpm"

log "DBeaver"
wget https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm -p "${TMP_DIR}"
sudo rpm -i "${TMP_DIR}/dbeaver-ce-latest-stable.x86_64.rpm"

log "Docker Engine"
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker
# sudoless for docker
sudo usermod -aG docker $USER


log "AWS CLI 2"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "${TMP_DIR}/awscliv2.zip"
unzip "${TMP_DIR}/awscliv2.zip" -d "${TMP_DIR}"
sudo "${TMP_DIR}/aws/install"

log "Postman"
curl -OJL https://dl.pstmn.io/download/latest/linux_64
mv postman-linux-x64.tar.gz "${TMP_DIR}"
tar -xvzf "${TMP_DIR}/postman-linux-x64.tar.gz" -C ~
username=$(whoami) envsubst '$username' < samples/postman.desktop > ~/.local/share/applications/postman.desktop

log "Golang"
read -p "Enter Golang version for install (1.22.5 for example): " golang_version
sudo rm -rf /usr/local/go
wget "https://go.dev/dl/go${golang_version}.linux-amd64.tar.gz" -P $TMP_DIR
if [[ -e "${TMP_DIR}/go${golang_version}.linux-amd64.tar.gz" ]]; then
    sudo tar -C /usr/local -xzf "${TMP_DIR}/go${golang_version}.linux-amd64.tar.gz"
else
    log "Golang wasn't installed, maybe incorrect version was passed"
fi

log "GNOME Shell fixes"
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.mutter draggable-border-width 15
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

flatpak --version
if [[ $? -eq 0 ]]; then
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatfefs=( org.telegram.desktop org.kde.kolourpaint app.drey.EarTag com.rafaelmardojai.Blanket de.haeckerfelix.Shortwave com.spotify.Client)
    for flref in ${flatfefs[@]}; do
        log "Flatpak: ${flref}"
        flatpak install -y flathub $flref
    done
else
    log "flatpak missed so flatpak packages weren't installed"
fi

if [[ ! -e ~/.gitconfig ]]; then
    log "Add Git config file"
    read -p "Enter fullname: " git_name
    read -p "Enter fullname: " git_email
    git_name=$git_name git_email=$git_email envsubst '$git_name,$git_email' < samples/.gitconfig > ~/.gitconfig
fi

if [[ ! -d ~/.aws ]]; then
    echo "Add AWS config files"
    mkdir ~/.aws
    read -p "Enter aws region: " aws_region
    read -p "Enter output: " aws_output
    read -p "Enter aws access key: " aws_access
    read -p "Enter aws secret key: " aws_secret
    aws_access=$aws_access aws_secret=$aws_secret envsubst '$aws_access,$aws_secret' < samples/.aws/credentails > ~/.aws/credentails
fi

log "fix dual boot time error in Windows and Ubuntu"
timedatectl set-local-rtc 1

log "Install Vundle (Vim plugin manager)"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
 
log "Install ohMyZSH"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

log "Nekoray client"
nekoray_url=$(curl -s https://api.github.com/repos/MatsuriDayo/nekoray/releases/latest  | jq -r '.assets[] | select(.name | contains ("AppImage")) | .browser_download_url')
wget "${nekoray_url}" -P $TMP_DIR  -O nekoray.AppImage
mkdir ~/Nekoray
mv "${TMP_DIR}/nekoray_latest.AppImage" ~/Nekoray/
mv samples/nekoray.png ~/Nekoray/
username=$(whoami) envsubst '$username' < samples/nekoray.desktop > ~/.local/share/applications/nekoray.desktop

log "Discord"
wget https://discord.com/api/download?platform=linux&format=tar.gz -P $TMP_DIR  -O discord.tar.gz
tar -xf "${TMP_DIR}/discord.tar.gz" Discord -C /usr/share/discord/ 
cp samples/discord.desktop > ~/.local/share/applications/discord.desktop

log "Copy vim,tmux,zsh configs"
cp -a samples/vim/. ~/
cp -a samples/tmux/. ~/
cp -a samples/zsh/. ~/

# TODO: maybe instruction from TV (firewall) + ubuntu cleaners

log "Check installed"
pass --version
git --version
jq --version
curl --version
vim --version
tmux --version
python --version
go version
aws --version
wg --version
zsh --version
flatpak --version
docker --version

echo "Next your manual steps:
1. Reboot;
2. Add VPN creds (wg & nekoray)
3. Install Slack, Discord from WEB;
4. Install in your Chrome-based browser GNOME Shell integration extension;
5. In CHROME install Gnome Extension install from README.md;
6. Apply dependencies in vim."
