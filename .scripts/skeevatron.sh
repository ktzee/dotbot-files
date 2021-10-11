#!/bin/bash

addondir="$HOME/Documents/Elder Scrolls Online/live/AddOns"
addonslist="$addondir/addons"
downloadpage="https://www.esoui.com/downloads/download"

# expects $1 == id
# prints finalurl
function getfinalurl() {
    awk 'BEGIN{
    RS="</a>"
    IGNORECASE=1
    }
    /Problems/ {
      for(o=1;o<=NF;o++){
        if ( $o ~ /href/){
          gsub(/.*href=\042/,"",$o)
          gsub(/\042.*/,"",$o)
          print $(o)
        }
      }
    }' <(curl -s "$downloadpage""$1")
}

# expects $1 == finalurl
function dlandunzip() {
    url="$1"
    f=$(mktemp /tmp/skeevatron.XXXXXX)
    curl -o "$f" "$url"
    unzip -o -d "$addondir" "$f" && rm "$f"
}

while IFS= read -r id; do
    finalurl=$(getfinalurl "$id")
    dlandunzip "$finalurl"
    sleep 0.5 # be nice
done < <(awk '{print $1}' "$addonslist")
