DIR="/home/$( whoami )/Desktop"

handle_selection() {
  if [ "$1" ]; then
    ID="$(grep -oP '(?<=rungameid/).*' "$DIR"/"$1".desktop)"
    steam steam://rungameid/"$ID" 
    notify-send "Steam" "Launching the game \"$1\""
  fi
}

handle_selection "$( cd "$DIR" || exit; ls -t  | sed 's/\.desktop//' | rofi -dmenu -i -p 'Launch game' -hlbg '#5FA5D7' -bc '#5FA5D7' -bw 3)"
