#!/usr/bin/env bash

hyprctl devices -j | awk '/"keyboards": \[/,/\]/' | grep '"name":' | awk -F'"' '{print $4}' | while read -r NAME; do
    hyprctl switchxkblayout "${NAME}" next > /dev/null
done