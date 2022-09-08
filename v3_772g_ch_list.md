# V3-772G
* True checkbox - automated step
* False checkbox - manual step

## Checklist
- [x] apt update && upgrade
- [x] apt install curl & git
- [x] apt install python3-pip && python-virtualenv
- [x] L2TP/IPSec libraries
- [x] Opera
- [x] Chrome
- [x] PyCharm Community
- [x] DBeaver
- [ ] Postman + Desktop Link
- [x] Docker Engine
- [x] awscli2
- [ ] Slack
- [ ] Discord
- [ ] Telegram ( via snap, flatpak or deb(!) )
- [ ] Pinta (via snap or flatpak)
- [x] chrome-gnome-shell
- [ ] GNOME Shell Integration in Chrome-based browser
- [x] imwheel + config
- [x] gsettings secongs for clock
- [x] creating templates for aws cli and gitconfig files in $HOME
- [x] Flatpak
- [ ] BT connect issue

## Download links
* [Slack](https://slack.com/downloads/linux)
* [Discord](https://discord.com/download)
* [GNOME Shell Integration](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep)
* [GNOME: Sound Input & Output Device Chooser](https://extensions.gnome.org/extension/906/sound-output-device-chooser/)
* [GNOME: Media Control](https://extensions.gnome.org/extension/4470/media-controls/)
* [GNOME: "App is ready" notification remover](https://extensions.gnome.org/extension/1007/window-is-ready-notification-remover/)

## Bluetooth issue
:exclamation: Before steps in terminal turn on bluetooth in `Settings`
	~$ bluetoothctl
	[bluetooth]# power on
	[bluetooth]# agent on
	[bluetooth]# default-agent
	[bluetooth]# scan on
	[bluetooth]# trust <MAC-address>
	[bluetooth]# pair <MAC-address>
	[bluetooth]# connect <MAC-address>
