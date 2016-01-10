#!/bin/bash

function download() {
  local BASENAME=`basename $1`
  if [ ! -f $BASENAME.done ]; then
    axel $1
    if [ $? -eq 0 ]; then
      if [ `sha256sum $1 | grep "^$2 " | wc` -eq 1 ]; then
        touch $BASENAME.done
      fi
    fi
  fi
}

FUNTOO_PATH="http://build.funtoo.org/funtoo-current/x86-64bit/intel64-sandybridge/2015-11-08"

download \
  $FUNTOO_PATH/stage3-intel64-sandybridge-funtoo-current-2015-11-08.tar.xz \
  33e22515b197ff9e710c41f332f0b91e319c3170e2234513344014ed6d0d1149

download \
  $FUNTOO_PATH/stage3-intel64-sandybridge-funtoo-current-2015-11-08.tar.xz \
  98462cc38a6877f31c20633de7c7a70fc418b0c8ea15f0ab208cb40d306448fc
