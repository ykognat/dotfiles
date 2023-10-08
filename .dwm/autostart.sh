sleep 4
unclutter -idle 30 -noevents & fcitx5 -d & Discord & /usr/libexec/notification-daemon & dwmblocks & mpd & firefox & volctl & syncthing & nm-applet &
#st -e newsboat  &
#sleep 1
st &
sleep 1
#st -e ncmpcpp & 
sxhkd &
setxkbmap us -variant colemak_dh &
sleep 5
# redshift-gtk -l $(curl -s "https://location.services.mozilla.com/v1/geolocate?key=geoclue" | jq -r '"\(.location.lat):\(.location.lng)"')
