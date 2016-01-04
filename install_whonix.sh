#!/bin/bash

source `dirname $0`/misc.sh

run_once sudo qubes-dom0-update --enablerepo=qubes-templates-community qubes-template-whonix-gw qubes-template-whonix-ws

run_once qvm-create sys-whonix --hvm --label red --template=whonix-gw --proxy
run_once qvm-create anon-whonix --hvm --label red --template=whonix-ws

run_once qvm-prefs sys-whonix -set netvm=sys-firewall
run_once qvm-prefs anon-whonix -set netvm=sys-whonix

run_once qvm-prefs whonix-gw -set netvm=sys-whonix
run_once qvm-prefs whonix-ws -set netvm=sys-whonix

run_once qvm-start sys-whonix
run_once qvm-start anon-whonix
