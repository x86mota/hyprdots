#!/bin/bash

wallpaperDir="${HOME}/.config/wallpapers"
supportedFiles=()
randomWallpaper=""
currentWallpaper=""

function IsInstalled {
    local package="$1"
    if pacman -Qs "${package}" >/dev/null 2>&1; then
        return 0
    else
        notify-send "Swww" "Package swww is not installed." 
        exit 1
    fi
}

function CheckWallpaperDir {
    if [[ -d ${wallpaperDir} ]]; then
        return 0
    else
        notify-send "Swww" "The wallpaper directory does not exist." 
        exit 1
    fi
}

function GetWallpapers {
    local supportedExtentions=("jpeg" "jpg" "png" "gif" "pnm" "tga" "tiff" "webp" "bmp" "farbfeld")

    for ext in "${supportedExtentions[@]}"; do
        while IFS= read -r -d '' file; do
            supportedFiles+=("$file")
        done < <(find "${wallpaperDir}" -maxdepth 1 -type f -iname "*.${ext}" -print0)
    done

    CheckWallpaperList
}

function CheckWallpaperList {
    if [[ ${#supportedFiles[@]} -gt 0 ]]; then
        return 0
    else
        notify-send "Swww" "The wallpaper folder is empty."
        exit 1
    fi
}

function GetRandomWall {
    GetCurrentWallpaper
    randomWallpaper=$(find "${supportedFiles[@]}" ! -name "$(basename "${currentWallpaper}")" | shuf -n 1 )

    echo "${randomWallpaper}"
}

function GetCurrentWallpaper {
    local CurrWall=""
    CurrWall=$(swww query | awk '{print $NF}')

    if [[ "${CurrWall}" != "000000" ]]; then
        currentWallpaper="${CurrWall}"
    else
        currentWallpaper=""
    fi
}

function SetWallpaper {
    GetRandomWall

    if [[ ${#supportedFiles[@]} -eq 1 ]]; then
        swww img "${supportedFiles[0]}" --transition-type none
        SetHyprlockBG "${supportedFiles[0]}"
        exit 0
    fi

    if [[ -n ${currentWallpaper} ]]; then
        swww img "${randomWallpaper}" --transition-type random --transition-fps 60 --transition-step 10 --transition-duration 10
    else
        swww img "${randomWallpaper}" --transition-type none
    fi

    SetHyprlockBG "${randomWallpaper}"
}

function SetHyprlockBG {
    local image=$1
    local hyprlockPath="${HOME}/.config/hypr/hyprlock.conf"
    
    if IsInstalled "hyprlock"; then
        sed -i "/background/,/}/s|^\(.*path =\).*|\1 $image|" "$hyprlockPath"
    fi
}

function AutoChangeWallpaper {
    local timeout=900

    while true; do
        SetWallpaper
        sleep "${timeout}"
    done
}

IsInstalled "swww" 

CheckWallpaperDir

GetWallpapers

if pgrep -x "swww-daemon" >/dev/null; then
    AutoChangeWallpaper
else
    notify-send "Swww" "The swww daemon is not running"
    exit 1
fi