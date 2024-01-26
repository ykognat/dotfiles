sleep 4
pipewire & unclutter -idle 30 -noevents & fcitx5 -d & /usr/libexec/notification-daemon & dwmblocks & firefox & syncthing & nm-applet & alacritty & blueman-applet & Discord & volctl & mpd & 
sleep 1
sxhkd &
sleep 5
/usr/local/bin/kanata --cfg /home/peter/.config/kanata/keymap.kbd &
