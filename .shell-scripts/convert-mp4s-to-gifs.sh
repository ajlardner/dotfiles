# use ffmpeg to convert all mp4s in a directory to gifs, and output them to another directory
# $1 = directory of mp4s to convert
# $2 = directory to output gifs to
MP4_DIR=${1:-$HOME/.wallpapers/mp4}
GIF_DIR=${2:-$HOME/.wallpapers/gif}
for f in "$1"/*.mp4
	do ffmpeg -n -i "$f" "$2""$(basename "$f" .mp4).gif" -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse"
done

