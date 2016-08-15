#!/bin/bash
TMP="$(mktemp -d)"
cd $TMP                                   # change this line to determine where the file is saved
youtube-dl -o %\(title\)s.%\(ext\)s "$1"  # -o output template is optional
# play with mplayer after download
#savename=`python2 youtube-dl -o %\(title\)s.%\(ext\)s --get-filename "$1"`
#mplayer -really-quiet "$savename"
#ratpoison -c "echo [ytdl-uzbl] $1 done."         # change this line to change how you are notified of a
#notify-send "Download" "file://$(readlink -f $TMP/*)"
mplayer "$(readlink -f $TMP/*)"
