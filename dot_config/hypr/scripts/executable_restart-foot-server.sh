#!/usr/bin/env bash
set -euo pipefail

setsid sh -lc '
  sleep 0.2
  pkill -u "$USER" -x footclient 2>/dev/null || true
  pkill -u "$USER" -x foot 2>/dev/null || true
  rm -f "${XDG_RUNTIME_DIR:-/run/user/$UID}"/foot-*.sock
  sleep 0.2
  command -v foot >/dev/null && foot --server >/tmp/foot-server.log 2>&1 &
' >/tmp/foot-restart.log 2>&1 &
