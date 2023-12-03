#!/bin/bash

sudo pacman -S i3-wm rofi networkmanager-dmenu-git light mpd alacritty polybar dmenu dunst feh i3lock xss-lock xsettingsd xsettings-client --noconfirm
[ -f /bin/yay ] && yay -S xfce-polkit

echo "setting up networkmanager-dmenu-git"
[ ! -d ~/.config/networkmanager-dmenu/ ] && mkdir ~/.config/networkmanager-dmenu/
cp -r ./rofi/network/config.ini ~/.config/networkmanager-dmenu/
