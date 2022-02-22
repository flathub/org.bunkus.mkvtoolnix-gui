#!/bin/bash

case "$1" in
  merge|info|extract|propedit)
    ACTION="$1"
    shift
    exec "mkv$ACTION" "$@"
    ;;
  mkvmerge|mkvinfo|mkvextract|mkvpropedit)
    ACTION="$1"
    shift
    exec "$ACTION" "$@"
    ;;
  *)
    if test -x /app/bin/mkvtoolnix-gui; then
      exec mkvtoolnix-gui "$@"
    fi
    exec mkvmerge "$@"
    ;;
esac
