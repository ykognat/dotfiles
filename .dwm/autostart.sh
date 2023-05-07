sleep 4
unclutter -idle 30 -noevents & fcitx5 -d & Discord & /usr/libexec/notification-daemon & dwmblocks & mpd & firefox & volctl & syncthing & nm-applet &
alacritty -e newsboat  &
sleep 1
alacritty &
sleep 1
alacritty -e ncmpcpp & 
sleep 5
# redshift-gtk -l $(curl -s "https://location.services.mozilla.com/v1/geolocate?key=geoclue" | jq -r '"\(.location.lat):\(.location.lng)"')
