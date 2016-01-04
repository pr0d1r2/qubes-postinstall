function run_once() {
  if [ ! -d ~/.run_once ]; then
    mkdir ~/.run_once
  fi
  local run_once_MARKER=~/.run_once/`echo $@ | tr ' ' '_'`
  if [ ! -f $run_once_MARKER ]; then
    $@ || return $?
    touch $run_once_MARKER
  fi
}
