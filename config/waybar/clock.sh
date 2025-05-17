#!/bin/bash

day=$(date '+%d')
text=$(date '+%a %F %H:%M')

# Get calendar output
cal_output=$(LANG=ja_JP.UTF-8 cal -m)

# Highlight current day
cal_output=$(echo "$cal_output" | sed "s/\b${day}\b/<span foreground='#3b82f6' underline=\"low\"><b>${day}<\/b><\/span>/")

# Split the calendar into lines
IFS=$'\n' read -rd '' -a lines <<< "$cal_output"

# Apply color to the weekday row (second row)
# Assuming the second line contains the weekdays Mo Tu We Th Fr Sa Su
if [[ ${#lines[@]} -ge 2 ]]; then
    lines[1]="<span foreground='#3b82f6'><b> ${lines[1]}</b></span>"
fi

# Rejoin with newlines and escape for JSON
tooltip=$(printf "%s\n" "${lines[@]}" | sed '{:q;N;s/\n/\\n/g;t q}' | sed 's/"/\\"/g')

# Output in JSON format with proper escaping
echo "{\"text\":\"${text}\",\"tooltip\":\"<span size='15pt' font='HackGen Console NF'>${tooltip}</span>\"}"
