#!/bin/bash

source `dirname $0`/../misc.sh

run_once qvm-clone debian-8 rails-development-template
run_once qvm-prefs -s rails-development-template netvm sys-whonix
run_once qvm-run -a rails-development-template "sudo apt-get install postgresql" -p
run_once qvm-run -a rails-development-template "sudo apt-get install vim-gtk" -p
run_once qvm-run -a rails-development-template "sudo apt-get install chromium" -p
run_once qvm-run -a rails-development-template "sudo apt-get install chromedriver" -p
run_once qvm-run -a rails-development-template "sudo apt-get install imagemagick" -p
run_once qvm-run -a rails-development-template "sudo apt-get install elasticsearch" -p
run_once qvm-shutdown rails-development-template

run_once qvm-create --label green --template=rails-development-template rails-development
run_once qvm-start rails-development

echo "NOTE: that you need to add USB hosts manually if you want to attach exernal disks"
