#!/bin/bash

source `dirname $0`/../misc.sh

run_once qvm-clone debian-8 media-player-template
run_once qvm-prefs -s media-player-template netvm sys-whonix
run_once qvm-run -a media-player-template "sudo apt-get install gnome-mplayer" -p
run_once qvm-prefs -s media-player-template netvm none
run_once qvm-shutdown media-player-template

run_once qvm-create --label green --template=media-player-template media-player
run_once qvm-prefs -s media-player netvm none
run_once qvm-start media-player

echo "NOTE: that you need to add USB hosts manually if you want to attach exernal disks"
