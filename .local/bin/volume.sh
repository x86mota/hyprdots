#!/bin/bash

# For output devices
function OutputGetVolume {
    local volume=$(pamixer --get-volume)
    echo "$volume"
}

function OutputIncreaseVolume {
    pamixer --increase 2 --allow-boost --set-limit 140 && NotifyUser --set-volume
}

function OutputDecreaseVolume {
    pamixer --decrease 2 && NotifyUser --set-volume
}

function OutputIsMuted {
    local isMute="$(pamixer --get-mute)"

    if [[ ${isMute} == "true" ]]; then
        return 0
    else
        return 1
    fi 
}

function OutputGetIcon {
    local currentVolume=$(OutputGetVolume)

    if OutputIsMuted; then
        echo "audio-volume-muted"
    elif [[ "${currentVolume}" -le 33 ]]; then
        echo "audio-volume-low"
    elif [[ "${currentVolume}" -le 66 ]]; then
        echo "audio-volume-medium"
    else
        echo "audio-volume-high"
    fi       
}

function OutputToggleMute {
    if OutputIsMuted; then
        pamixer --unmute && NotifyUser --toggle-unmute
    else
        pamixer --mute && NotifyUser --toggle-mute
    fi
}

# For input devices
function InputGetVolume {
    local volume=$(pamixer --default-source --get-volume)
    echo "$volume"
}

function InputIncreaseVolume {
    pamixer --default-source --increase 2 && NotifyUser --mic-set-volume
}

function InputDecreaseVolume {
    pamixer --default-source --decrease 2 && NotifyUser --mic-set-volume
}

function InputIsMuted {
    local isMute="$(pamixer --default-source --get-mute)"

    if [[ ${isMute} == "true" ]]; then
        return 0
    else
        return 1
    fi 
}

function InputGetIcon {
    local currentVolume=$(InputGetVolume)

    if InputIsMuted; then
        echo "audio-input-microphone-muted"
    elif [[ "${currentVolume}" -le 33 ]]; then
        echo "audio-input-microphone-low"
    elif [[ "${currentVolume}" -le 66 ]]; then
        echo "audio-input-microphone-medium"
    else
        echo "audio-input-microphone-high"
    fi       
}

function InputToggleMute {
    if InputIsMuted; then
        pamixer --default-source --unmute && NotifyUser --mic-toggle-unmute
    else
        pamixer --default-source --mute && NotifyUser --mic-toggle-mute
    fi
}

# Notify User function
function NotifyUser {
    local defaultArgs="-e -h string:x-canonical-private-synchronous:volume_notif -u low"
    case ${1} in
        --toggle-mute)
            notify-send ${defaultArgs} -h int:value:"$(OutputGetVolume)" -i "$(OutputGetIcon)" "Volume Muted"
            ;;
        --toggle-unmute)
            notify-send ${defaultArgs} -h int:value:"$(OutputGetVolume)" -i "$(OutputGetIcon)" "Volume Unmuted $(OutputGetVolume)%"
            ;;
        --set-volume)
            notify-send ${defaultArgs} -h int:value:"$(OutputGetVolume)" -i "$(OutputGetIcon)" "Volume Level $(OutputGetVolume)%"
            ;;
        --mic-toggle-mute)
            notify-send ${defaultArgs} -h int:value:"$(InputGetVolume)" -i "$(InputGetIcon)" "Microphone Muted"
            ;;
        --mic-toggle-unmute)
            notify-send ${defaultArgs} -h int:value:"$(InputGetVolume)" -i "$(InputGetIcon)" "Microphone Unmuted $(InputGetVolume)%"
            ;;
        --mic-set-volume)
            notify-send ${defaultArgs} -h int:value:"$(InputGetVolume)" -i "$(InputGetIcon)" "Microphone Level $(InputGetVolume)%"
            ;;
    esac
}

case ${1} in
    --increase)
        OutputIncreaseVolume
        ;;
    --decrease)
        OutputDecreaseVolume
        ;;
    --toggle-mute)
        OutputToggleMute
        ;;
    --mic-increase)
        InputIncreaseVolume
        ;;
    --mic-decrease)
        InputDecreaseVolume
        ;;
    --mic-toggle-mute)
        InputToggleMute
        ;;
esac