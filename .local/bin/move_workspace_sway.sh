#!/bin/bash
outputs=$(swaymsg -t get_outputs | jq -r 'map(select(.active == true)) | .[].name')
current=$(swaymsg -t get_outputs | jq -r 'map(select(.focused == true)) | .[0].name')
arr=($outputs)
for i in "${!arr[@]}"; do
  [[ "${arr[$i]}" == "$current" ]] && current_index=$i && break
done
if [ "$1" == "next" ]; then
  next_index=$(( (current_index + 1) % ${#arr[@]} ))
elif [ "$1" == "prev" ]; then
  next_index=$(( (current_index - 1 + ${#arr[@]}) % ${#arr[@]} ))
fi
swaymsg move workspace to output ${arr[$next_index]}
