#!/bin/sh

# Get metadata from the active MPRIS player
PLAYER="$(playerctl -l | grep -v 'firefox' | head -1)"  # Ignore Firefox
METADATA="$(playerctl -p "$PLAYER" metadata --format '{{ artist }} - {{ title }}' 2>/dev/null)"
STATUS="$(playerctl -p "$PLAYER" status 2>/dev/null)"

# Show icon + text if playing/paused
if [ "$STATUS" = "Playing" ] || [ "$STATUS" = "Paused" ]; then
  echo "󰎈 ${METADATA:0:30}..."  # Trim long text
else
  echo "󰽳 No Music"
fi
