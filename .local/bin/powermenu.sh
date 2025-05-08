#!/usr/bin/env bash

# Variables
dir="${HOME}/.config/rofi"
uptime="`uptime -p | sed -e 's/up //g'`"
lock=''
suspend=''
logout=''
reboot=''
shutdown=''
yes=''
no=''
rofiOptions="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

logoutMessage="Log out of the system now?"
rebootMessage="Reboot the system now?"
shutdownMessage="Power off the system now?"

function _confirmDialog {
	local warningMessage="${1}"
	response=$(echo -e "$no\n$yes" | rofi -dmenu -p "${warningMessage}" -theme ${dir}/confirmDialog.rasi)

	if [[ "$response" == "$yes" ]]; then
        return 0
    else
        return 1
    fi
}

choice="$(echo -e "$rofiOptions" | rofi -dmenu -p "Uptime: $uptime" -theme ${dir}/powermenu.rasi)"

case ${choice} in
	$lock)
		hyprlock
		;;
	$suspend)
		_confirmDialog && systemctl suspend
		;;
	$logout)
		_confirmDialog "${logoutMessage}" && hyprctl dispatch exit
		;;
	$reboot)
		_confirmDialog "${rebootMessage}" && systemctl reboot
		;;
	$shutdown)
		_confirmDialog "${shutdownMessage}" && systemctl poweroff
		;;
esac