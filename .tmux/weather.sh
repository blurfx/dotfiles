#!/bin/bash
CACHE_FILE="/tmp/tmux-weather"
CACHE_TIMEOUT=600

if [ ! -f "$CACHE_FILE" ] || [ $(( $(date +%s) - $(stat -f %m "$CACHE_FILE" 2>/dev/null || echo 0) )) -gt $CACHE_TIMEOUT ]; then
    curl -s 'wttr.in/?format=%C+%t'> "$CACHE_FILE"
fi

cat "$CACHE_FILE"

