#!/bin/sh
# from https://codeberg.org/LGFae/awww/src/branch/main/example_scripts/awww_randomize_multi.sh#
# For each display, changes the wallpaper to a randomly chosen image in
# a given directory at a set interval.

# my changes - if there are subdirectories of DIRECTORY matching monitor resolutions in the form WIDTHxHEIGHT, e.g. 1920x1080, use only images from that folder for monitors with that resolution

DEFAULT_INTERVAL=300 # In seconds

if [ $# -lt 1 ] || [ ! -d "$1" ]; then
	printf "Usage:\n\t\e[1m%s\e[0m \e[4mDIRECTORY\e[0m [\e[4mINTERVAL\e[0m]\n" "$0"
	printf "\tChanges the wallpaper to a randomly chosen image in DIRECTORY every\n\tINTERVAL seconds (or every %d seconds if unspecified)." "$DEFAULT_INTERVAL"
	printf "\tIf DIRECTORY contains WIDTHxHEIGHT subdirectories, i.e. 1920x1080,\n\tmonitors will use images from the subdirectory that matches their resolution.\n"
	exit 1
fi

# See awww-img(1)
RESIZE_TYPE="fit"
export AWWW_TRANSITION="fade"
export AWWW_TRANSITION_FPS="${AWWW_TRANSITION_FPS:-60}"
export AWWW_TRANSITION_STEP="${AWWW_TRANSITION_STEP:-45}"

# my version for different resolution directories
while true; do
	cache_dir=$(mktemp -d) || exit 1
	# loop through a list of monitors and their resolutions from awww query and select an image from the directory for the given resolution if it exists
	awww query | 
	awk '{
		gsub(/:/, "", $2)
		gsub(/,/, "", $3)
		print $2, $3
	}' | 
	while read -r monitor resolution; do
		if [ -d "$1/$resolution" ]; then
			img_dir="$1/$resolution"
			imgs="$cache_dir/cache-$resolution"
		else
			img_dir="$1"
			imgs="$cache_dir/cache-fallback"
		fi
		
		if [ ! -e "$imgs" ]; then
			for image in "$img_dir"/* "$img_dir"/.[!.]* "$img_dir"/..?*; do
			   [ -f "$image" ] || continue
			   printf '%s\n' "$image"
		       	done |
		       	awk 'BEGIN { srand() } {
				printf "%.17f\t%s\n", rand(), $0
		       	}' |
		       	sort -n |
		       	cut -f2- > "$imgs"
		fi
		
		if [ ! -s "$imgs" ]; then
			printf 'No images remaining for %s\n' "$monitor" >&2
			continue
		fi

		image=$(sed -n '1p' "$imgs")

		sed '1d' "$imgs" > "$imgs.new" && mv "$imgs.new" "$imgs"

		awww img --resize "$RESIZE_TYPE" --outputs "$monitor" "$image"
	done
	sleep "${2:-$DEFAULT_INTERVAL}"
done

# version from example scripts on github
# while true; do
# 	find "$1" -type f \
# 	| while read -r img; do
# 		echo "$(</dev/urandom tr -dc a-zA-Z0-9 | head -c 8):$img"
# 	done \
# 	| sort -n | cut -d':' -f2- \
# 	| while read -r img; do
# 		for d in $(awww query | awk '{print $2}' | sed s/://); do # see awww-query(1)
# 			# Get next random image for this display, or re-shuffle images
# 			# and pick again if no more unused images are remaining
# 			[ -z "$img" ] && if read -r img; then true; else break 2; fi
# 			awww img --resize "$RESIZE_TYPE" --outputs "$d" "$img"
# 			unset -v img # Each image should only be used once per loop
# 		done
# 		sleep "${2:-$DEFAULT_INTERVAL}"
# 	done
# done

