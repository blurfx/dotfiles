#!/bin/bash
CACHE_FILE="/tmp/tmux-weather"
CACHE_TIMEOUT=300

if [ ! -f "$CACHE_FILE" ] || [ $(( $(date +%s) - $(stat -f %m "$CACHE_FILE" 2>/dev/null || echo 0) )) -gt $CACHE_TIMEOUT ]; then
    curl -m 10 -sfo "$CACHE_FILE" 'wttr.in/?format=%C%20%t'
    if [ $? -ne 0 ]; then
        rm -f "$CACHE_FILE"
    fi
fi

cat $CACHE_FILE

if [ $? -ne 0 ]; then
    echo "you will die someday"
fi
