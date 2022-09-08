#!usr/bin/bash

username="$(whoami)"

echo "[Desktop Entry]
Encoding=UTF-8
Version=1.0
Name=Postman
Comment=Postman Native App
Exec=/home/$username/Postman/Postman — %u
Icon=/home/$username/Postman/app/icons/icon_128x128.png
Terminal=false
StartupWMClass=postman
Type=Application
Categories=Network;
MimeType=x-scheme-handler/tg;
X-Desktop-File-Install-Version=0.22" > ~/.local/share/applications/postman.desktop
