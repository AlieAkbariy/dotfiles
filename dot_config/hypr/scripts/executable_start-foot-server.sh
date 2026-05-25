#!/usr/bin/env bash
set -euo pipefail

command -v foot >/dev/null || exit 0

socket="${XDG_RUNTIME_DIR:-/run/user/$UID}/foot-${WAYLAND_DISPLAY:-wayland-1}.sock"
[[ -S "$socket" ]] && exit 0

foot --server >/tmp/foot-server.log 2>&1 &
