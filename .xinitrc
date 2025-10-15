dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

picom_version=$(picom --version)

gnome-keyring-daemon -r -d &
autorandr --change --force && nitrogen --restore;
sxhkd &
if [ "$picom_version" = 'v9.1' ]; then
    picom --experimental-backends &
else
    picom &
fi
dunst &
sxbar &

exec sxwm
