# Nitro-AN517-54-PopOS-Fan-Control
Fan control and Nitro mode setup for Acer Nitro AN517-54 on Pop!_OS using NB
# Acer Nitro AN517-54 – Pop!_OS Fan Control Guide

## Hardware
- Model: Acer Nitro AN517-54
- GPU Mode: NVIDIA
- OS: Pop!_OS 22.04+

## Working NBFC Profile
Profile used:
Acer Nitro AN515-58

Fully compatible:
- EC read/write works
- Dual fan control works
- No EC errors
- Stable under stress

## Power Management
Using system76-power:

Performance Mode:
- Governor: performance
- Turbo enabled
- Max freq: 4.6 GHz

Balanced Mode:
- Governor still allows turbo
- Lower power scheduling

## Nitro Toggle Script
```bash
#!/bin/bash

STATE_FILE="/tmp/nitro_state"

if [ ! -f "$STATE_FILE" ]; then
    echo "normal" > "$STATE_FILE"
fi

STATE=$(cat "$STATE_FILE")

if [ "$STATE" = "normal" ]; then
    echo "Switching to NITRO mode..."
    system76-power profile performance
    nbfc start
    notify-send "🔴 NITRO MODE" "Performance profile activated"
    echo "nitro" > "$STATE_FILE"
else
    echo "Switching to NORMAL mode..."
    system76-power profile balanced
    nbfc start
    notify-send "🔵 NORMAL MODE" "Balanced profile activated"
    echo "normal" > "$STATE_FILE"
fi
```
6fd3859 (Initial release - AN517-54 working setup)
