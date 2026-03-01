#!/bin/bash
set -e

CURRENT=$(system76-power profile | awk -F': ' '/Power Profile/ {print $2}')

if [ "$CURRENT" = "Performance" ]; then
    system76-power profile balanced 2>/dev/null || true
    nbfc start
    notify-send "🔵 NORMAL MODE" "Balanced profile activated"
else
    system76-power profile performance 2>/dev/null || true
    nbfc start
    notify-send "🔴 NITRO MODE" "Performance profile activated"
fi
