#!/usr/bin/env bash
# Bondi soundboard — click through the classic Mac sounds like the old
# Sound control panel. Pick a number, hear the sound, feel 1998.
set -u
DIR="$(cd "$(dirname "$0")/bondi/stereo" && pwd)"

play() {
  local f="$DIR/$1"
  if command -v canberra-gtk-play >/dev/null; then
    canberra-gtk-play -f "$f"
  elif command -v paplay >/dev/null; then
    paplay "$f"
  elif command -v ffplay >/dev/null; then
    ffplay -nodisp -autoexit -loglevel quiet "$f"
  else
    echo "No audio player found (need canberra-gtk-play, paplay, or ffplay)."
    exit 1
  fi
}

declare -A S=(
  [1]="desktop-login.ogg|Startup chime (G3)"
  [2]="bell.ogg|Wild Eep"
  [3]="dialog-information.ogg|Droplet"
  [4]="dialog-warning.ogg|Quack"
  [5]="dialog-error.ogg|Sosumi"
  [6]="dialog-question.ogg|Indigo"
  [7]="button-pressed.ogg|Tink"
  [8]="audio-volume-change.ogg|Glass"
  [9]="message-new-instant.ogg|Ping"
  [10]="message-sent-instant.ogg|Pop"
  [11]="phone-incoming-call.ogg|Submarine"
  [12]="trash-empty.ogg|Funk"
  [13]="device-added.ogg|Hero"
  [14]="device-removed.ogg|Frog"
  [15]="power-plug.ogg|Purr"
  [16]="power-unplug.ogg|Basso"
  [17]="window-new.ogg|Boing"
  [18]="network-connectivity-lost.ogg|Morse"
)

while true; do
  echo "--- Bondi soundboard ---"
  for i in $(seq 1 18); do
    IFS='|' read -r _ label <<< "${S[$i]}"
    printf "%2d) %s\n" "$i" "$label"
  done
  echo "  q) quit"
  read -rp "> " choice
  [[ "$choice" == q ]] && break
  if [[ -n "${S[$choice]:-}" ]]; then
    IFS='|' read -r file _ <<< "${S[$choice]}"
    play "$file"
  else
    echo "Pick 1-18 or q."
  fi
done
