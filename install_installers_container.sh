#!/bin/bash

source `dirname $0`/misc.sh
source `dirname $0`/install_fedora_minimal.sh

run_once qvm-create --label yellow --template=fedora-21-minimal installers-container

run_once qvm-prefs -s installers-container netvm sys-whonix

run_once qvm-start installers-container

run_once qvm-run -a installers-container "su - root -c 'yum install axel'"

run_once qvm-run -a -p installers-container \
  "axel https://raw.githubusercontent.com/pr0d1r2/qubes-postinstall/master/installers_container/download.sh"

run_once qvm-run -a -p installers-container "sh download.sh"
