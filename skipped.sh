echo "Opera browser"
curl -fsSL https://deb.opera.com/archive.key | sudo gpg --dearmor -o /usr/share/keyrings/operabrowser-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/operabrowser-keyring.gpg] https://deb.opera.com/opera-stable/ stable non-free" | sudo tee /etc/apt/sources.list.d/opera-stable.list
sudo apt update
sudo apt install -y opera-stable
#
echo "Opera libffmpeg fix"
sudo snap install chromium-ffmpeg
sudo cp /snap/chromium-ffmpeg/current/chromium-ffmpeg-107578/chromium-ffmpeg/libffmpeg.so /usr/lib/x86_64-linux-gnu/opera/libffmpeg.so
#
echo "PyCharm Community"
sudo snap install pycharm-community --classic
#
echo "Intellij IDEA Community"
sudo snap install intellij-idea-community --classic

echo "L2TP/IPSec client libraries"
sudo apt install -y network-manager-l2tp  network-manager-l2tp-gnome

# problems with autocomplete downloadnig in curl
#echo "Discord"
#curl -o discrod.deb O -J -L https://discord.com/api/download?platform=linux&format=deb
#sudo dpkg -i discord
#sudo apt install -f

log "Telegram"
wget https://dl.flathub.org/repo/appstream/org.telegram.desktop.flatpakref -d "${TMP_DIR}" > /dev/null
sudo flatpak install -y "${TMP_DIR}/org.telegram.desktop.flatpakref" > /dev/null

log "KDE Clocks"
wget https://dl.flathub.org/repo/appstream/org.gnome.clocks.flatpakref -d "${TMP_DIR}" > /dev/null
sudo flatpak install -y "${TMP_DIR}/org.gnome.clocks.flatpakref" > /dev/null

log "KolourPaint"
wget https://dl.flathub.org/repo/appstream/org.kde.kolourpaint.flatpakref -d "${TMP_DIR}" > /dev/null
sudo flatpak install -y "${TMP_DIR}/org.kde.kolourpaint.flatpakref" > /dev/null

log "Ear Tag"
wget https://dl.flathub.org/repo/appstream/app.drey.EarTag.flatpakref -d "${TMP_DIR}" > /dev/null
sudo flatpak install -y "${TMP_DIR}/app.drey.EarTag.flatpakref" > /dev/null

log "Blanket"
wget https://dl.flathub.org/repo/appstream/com.rafaelmardojai.Blanket.flatpakref -d "${TMP_DIR}" > /dev/null
sudo flatpak install -y "${TMP_DIR}/com.rafaelmardojai.Blanket.flatpakref" > /dev/null

log "ShortWave"
wget https://dl.flathub.org/repo/appstream/de.haeckerfelix.Shortwave.flatpakref -d "${TMP_DIR}" > /dev/null
sudo flatpak install -y "${TMP_DIR}/org.kde.kolourpaint.flatpakref" > /dev/null
