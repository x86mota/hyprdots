#!/bin/bash

function _endProcess {
    local process="$1"

    pgrep -f "${process}" | while read -r pid; do
        kill "${pid}"
    done
}

if pgrep -f "swwwLauncher.sh"; then
    _endProcess "swwwLauncher.sh"
    _endProcess "sleep"
fi

swwwLauncher.sh