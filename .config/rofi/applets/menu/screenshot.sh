#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/screenshot.rasi"

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "Please install 'flameshot' first."
}

# Options
screen=""
area=""
window=""

# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -p 'App : flameshot' -dmenu -selected-row 1)"
case $chosen in
    $screen)
        sleep 1; flameshot full -p ~/Pictures/Screenshots
        ;;
    $area)
        sleep 1; flameshot gui
        ;;
    $window)
        sleep 1; flameshot screen -p ~/Pictures/Screenshots
        ;;
esac

