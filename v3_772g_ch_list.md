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
- [x] Intellij IDEA Community
- [x] DBeaver
- [ ] Postman + Desktop Link
- [x] Docker Engine
- [x] awscli2
- [ ] Slack
- [ ] Discord
- [ ] Telegram (via Snap, Flatpak)
- [ ] Pinta (via Flatpak)
- [ ] Clocks (via Flatpak or Snap)
- [x] chrome-gnome-shell
- [ ] GNOME Shell Integration in Chrome-based browser
- [x] imwheel + config
- [x] gsettings secongs for clock
- [x] creating templates for aws cli and gitconfig files in $HOME
- [x] Flatpak
- [x] fix dualboot time issue
- [ ] BT connect issue

## Download links
* [Slack](https://slack.com/downloads/linux)
* [Discord](https://discord.com/download)
* [GNOME Shell Integration](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep)
* [GNOME: Sound Input & Output Device Chooser](https://extensions.gnome.org/extension/906/sound-output-device-chooser/)
* [GNOME: Media Control](https://extensions.gnome.org/extension/4470/media-controls/)
* [GNOME: "App is ready" notification remover](https://extensions.gnome.org/extension/1007/window-is-ready-notification-remover/)
* [GNOME: Bluetooth Quick Connect](https://extensions.gnome.org/extension/1401/bluetooth-quick-connect/)
* [GNOME: Notification Banner Position](https://extensions.gnome.org/extension/4105/notification-banner-position/)
* [GNOME: Notification Banner Reloaded](https://extensions.gnome.org/extension/4651/notification-banner-reloaded/)

## Sharing screen issue
In `/etc/gdm3/custom.conf` uncomment WaylandEnable=false for launching session via X11.

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

