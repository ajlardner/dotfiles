#!/bin/sh
set -eu
folder="$HOME/pictures/screenshots"
mkdir -p "$folder"
file="$folder/screenshot-$(date +%Y-%m-%d-%H-%M-%S).png"
case "${1:-region}" in
    region)
        geometry=$(slurp -d) || exit 0
        [ -n "$geometry" ] || exit 0
        grim -g "$geometry" "$file"
        ;;
    output)
        geometry=$(slurp -o) || exit 0
        [ -n "$geometry" ] || exit 0
        grim -g "$geometry" "$file"
        ;;
    window)
        geometry=$(mmsg get focusing-client | jq -er '"\(.x),\(.y) \(.width)x\(.height)"') || exit 1
        grim -g "$geometry" "$file"
        ;;
    *) exit 2 ;;
esac
