#!/bin/bash

# Kill already running process
_ps=(picom dunst mpd xfce-polkit xfce4-power-manager)
for _prs in "${_ps[@]}"; do
	if [[ $(pidof ${_prs}) ]]; then
		killall -9 ${_prs} 2>/dev/null
	fi
done

# Fix cursor
xsetroot -cursor_name left_ptr 2>/dev/null

# Polkit agent
/usr/lib/xfce-polkit/xfce-polkit &

# Enable power management
xfce4-power-manager &

# Restore wallpaper
feh ~/.config/i3/wallpaper/wallpaper.png --bg-fill &

# Lauch notification daemon
~/.config/i3/bin/i3dunst.sh

# Lauch polybar
polybar -c ~/.config/i3/polybar/config.ini &
disown

# Lauch compositor
#picom --conf ~/.config/i3/picom.conf --experimental-backends & disown

# Start mpd
exec mpd &
