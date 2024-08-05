# V3-772G
* True checkbox - automated step
* False checkbox - manual step

## Checklist
- [x] apt update && upgrade
- [x] apt install curl git pass vim tmux heif-gdk-pixbuf heif-thumbnailer wireguard jq zsh python3-pip && python-virtualenv
- [x] snap install vlc
- [x] Chrome
- [x] VSCode
- [x] DBeaver
- [x] Postman + Desktop Link
- [x] Docker Engine
- [x] awscli2
- [ ] Slack
- [ ] Discord
- [x] Flatpak and packet: telegram, Kolourpaint, clocks, Shotwave, EarTag
- [x] chrome-gnome-shell
- [ ] GNOME Shell Integration in Chrome-based browser
- [x] gsettings secongs for clock
- [x] creating templates for aws cli and gitconfig files in $HOME
- [x] fix dualboot time issue
- [x] Nekoray client
- [x] vim,tmux,zsh configs
- [ ] BT connect issue (only V3-772G)

## Download links
* [Slack](https://slack.com/downloads/linux)
* [Discord](https://discord.com/download)
* [GNOME Shell Integration](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep)
* [GNOME: Sound Input & Output Device Chooser](https://extensions.gnome.org/extension/906/sound-output-device-chooser/)
* [GNOME: Media Control](https://extensions.gnome.org/extension/4470/media-controls/)
* [GNOME: "App is ready" notification remover](https://extensions.gnome.org/extension/1007/window-is-ready-notification-remover/)
* [GNOME: Bluetooth Quick Connect](https://extensions.gnome.org/extension/1401/bluetooth-quick-connect/)
* [GNOME: WireGuard Indicator](https://extensions.gnome.org/extension/3612/wireguard-indicator/)
* [GNOME: Notification Banner Position](https://extensions.gnome.org/extension/4105/notification-banner-position/)
* [GNOME: Notification Banner Reloaded](https://extensions.gnome.org/extension/4651/notification-banner-reloaded/)

## Sharing screen issue
In `/etc/gdm3/custom.conf` uncomment WaylandEnable=false for launching session via X11.

## Bluetooth issue (actual for v3-772g)
:exclamation: Before steps in terminal turn on bluetooth in `Settings`

    ~$ bluetoothctl
    [bluetooth]# power on
    [bluetooth]# agent on
    [bluetooth]# default-agent
    [bluetooth]# scan on
    [bluetooth]# trust <MAC-address>
    [bluetooth]# pair <MAC-address>
    [bluetooth]# connect <MAC-address>

