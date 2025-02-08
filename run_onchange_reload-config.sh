#!/bin/bash

# Reload i3 configuration
if pgrep i3 > /dev/null; then
    i3-msg reload
fi

# Reload kitty configuration
if pgrep kitty > /dev/null; then
    pkill -USR1 kitty
fi

# Source zshrc in all active zsh sessions
for pid in $(pgrep zsh); do
    if [[ -d "/proc/$pid" ]]; then
        echo "source ~/.zshrc" > /proc/$pid/fd/0
    fi
done

# setup vim dependancies
vi +'PlugClean --sync' +qa
vi +'PlugInstall --sync' +qa
