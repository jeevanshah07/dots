#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/apps.rasi"

# Links
terminal=""
files=""
editor=""
browser=""
# music=""
settings=""

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Variable passed to rofi
# options="$terminal\n$files\n$editor\n$browser\n$music\n$settings"
options="$terminal\n$files\n$editor\n$browser\n$settings"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
case $chosen in
    $terminal)
	  konsole
      ;;
    $files)
		ranger
        ;;
    $editor)
		nvim
        ;;
    $browser)
	    firefox	
        ;;
  #   $music)
		# if [[ -f /usr/bin/lxmusic ]]; then
		# 	lxmusic &
		# else
		# 	msg "No suitable music player found!"
		# fi
  #       ;;
    $settings)
      # https://docs.kde.org/stable5/en/systemsettings/systemsettings/using-kapp.html
		systemsettings5 
        ;;
esac
