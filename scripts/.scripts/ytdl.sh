#!/bin/sh

while true; do
  read -r -p "Youtube url (enter x to exit): " url
  if [[ "$url" == "x" ]]; then exit 0; fi
  yt-dlp --extractor-args "youtube:player-client=default,-tv_simply" -x $url
done
