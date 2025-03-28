#!/usr/bin/env bash

function _VerifyDirectory {
    local WallpapersDir="${HOME}/.config/wallpapers"
    local SupportedExtentions=("jpeg" "jpg" "png" "gif" "pnm" "tga" "tiff" "webp" "bmp" "farbfeld")
    local SupportedFiles=()

    if [[ -d ${WallpapersDir} ]]; then
        for ext in "${SupportedExtentions[@]}"; do
            while IFS= read -r -d '' arquive; do
                SupportedFiles+=("$arquive")
            done < <(find "${WallpapersDir}" -maxdepth 1 -type f -iname "*.${ext}" -print0)
        done

        [[ ${#SupportedFiles[@]} -gt 0 ]] && {
            _SetWallpaper "${SupportedFiles[@]}"
            return 0
        } || notify-send "The wallpaper folder is expected to have at least 1 image." && exit 1
    else
        notify-send "The wallpaper directory does not exist." 
        exit 1
    fi
}

function _SetWallpaper {
    local files=("$@")

    if [ "${#files[@]}" -eq 1 ]; then
        swww img "${files[0]}" --transition-type none
        _SetHyprlockBG
    else
        local timeout=900
        local wallpaper=""
        local previous=""
        
        while true; do
            while [ "${wallpaper}" == "${previous}" ]; do
                wallpaper="${files[RANDOM % ${#files[@]}]}"
            done

            previous="${wallpaper}"

            swww img "${wallpaper}" --transition-type random --transition-fps 60 --transition-step 10 --transition-duration 10
            _SetHyprlockBG
            sleep "${timeout}"
        done
    fi
}

function _SetHyprlockBG {
    if pacman -Q hyprlock > /dev/null; then
        hyprlock_path="${HOME}/.config/hypr/hyprlock.conf"
        image=$(swww query | awk '{print $NF}')
        sed -i "/background/,/}/s|^\(.*path =\).*|\1 $image|" "$hyprlock_path"
    fi
}

if ! pacman -Qs swww >/dev/null 2>&1; then
    notify-send "Package swww is not installed." 
    exit 1
fi

daemon="swww-daemon"
if pgrep -x "${daemon}" >/dev/null; then
    _VerifyDirectory
else
    ${daemon} &
    sleep 2
    if pgrep -x "${daemon}" >/dev/null; then
        _VerifyDirectory
    else
        notify-send "Failed to start the ${daemon} process."
        exit 1
    fi
fi