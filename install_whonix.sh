#!/bin/bash

source `dirname $0`/misc.sh

run_once sudo qubes-dom0-update --enablerepo=qubes-templates-community qubes-template-whonix-gw qubes-template-whonix-ws

run_once qvm-create --label red --template=whonix-gw --proxy sys-whonix
run_once qvm-create --label red --template=whonix-ws anon-whonix

run_once qvm-prefs -s sys-whonix netvm sys-firewall
run_once qvm-prefs -s anon-whonix netvm sys-whonix

run_once qvm-prefs -s whonix-gw netvm sys-whonix
run_once qvm-prefs -s whonix-ws netvm sys-whonix

run_once qvm-start sys-whonix
run_once qvm-start anon-whonix
