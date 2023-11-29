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
[ -f /usr/lib/xfce-polkit/xfce-polkit ] && /usr/lib/xfce-polkit/xfce-polkit &

# Enable power management
# xfce4-power-manager &

# Restore wallpaper
[ -f /bin/feh ] && feh ~/.config/i3/wallpaper/wallpaper.png --bg-fill &

# Lauch notification daemon
[ -f /bin/dunst ] && ~/.config/i3/bin/i3dunst.sh

# Lauch polybar
[ -f /bin/polybar ] && polybar -c ~/.config/i3/polybar/config.ini &
disown

# Lauch compositor
#picom --conf ~/.config/i3/picom.conf --experimental-backends & disown

# Start mpd
[ -f /bin/mpd ] && exec mpd &

# i3lock

[ -f /bin/xss-lock ] && [ -f /bin/i3lock ] && xss-lock --transfer-sleep-lock -- i3lock -i ~/.wallpaper.png --nofork &
disown
