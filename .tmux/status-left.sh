#!/bin/bash

current_session=$(tmux display-message -p '#S')

tmux list-sessions -F '#{session_id}:#{session_name}' | sed 's/\$//g' | while read -r line; do
    session_id=$(echo "$line" | cut -d: -f1)
    session_name=$(echo "$line" | cut -d: -f2)
    if [ "$session_name" = "$current_session" ]; then
        echo -n "#[fg=colour214][$session_id]$session_name "
    else
        echo -n "#[fg=colour245][$session_id]$session_name "
    fi
done

