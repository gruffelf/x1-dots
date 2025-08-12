#!/bin/bash

# Define your profiles
PROFILE1="laptop-battery-powersave"
PROFILE2="laptop-ac-powersave"

# Get current profile
CURRENT=$(tuned-adm active | grep -oP '(?<=Current active profile: ).*')

# Determine the next profile
if [ "$CURRENT" == "$PROFILE1" ]; then
    NEXT=$PROFILE2
		echo "off" > "~/scripts/status"
else
    NEXT=$PROFILE1
		echo "on" > "~/scripts/status"
fi

tuned-adm profile "$NEXT"

pkill -RTMIN+3 waybar
