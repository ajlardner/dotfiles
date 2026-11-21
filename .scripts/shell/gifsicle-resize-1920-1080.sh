# resize any gifs in the current directory that aren't currently 1920x1080 to 1920x1080
# use gifsicle -I to get info
# use awk with code below to get filenames for any gifs that aren't 1920x1080
# pass that to xargs f
gifsicle -I ./*.gif | awk '
     /^\* / {
       name = substr($0, 3)
       sub(/ [0-9]+ images?$/, "", name)
     }
     $1 == "logical" && $2 == "screen" && $3 != "1920x1080" {
       print name
     }
   ' | xargs -r -d '\n' gifsicle --resize-fit 1920x1080 --batch
