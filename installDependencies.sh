#!/bin/bash

sudo pacman -S i3-wm rofi networkmanager-dmenu-git light mpd alacritty polybar dmenu dunst feh --noconfirm

echo "setting up networkmanager-dmenu-git"
[ ! -d ~/.config/networkmanager-dmenu/ ] && mkdir ~/.config/networkmanager-dmenu/
cp -r ./rofi/network/config.ini ~/.config/networkmanager-dmenu/
