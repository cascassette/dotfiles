#!/bin/bash

keymap=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | egrep -w 'KeyboardLayout Name' |sed -E 's/^.+ = \"?([^\"]+)\"?;$/\1/')

if [[ "$keymap" == "Dvorak" ]]
then
  cat .aerospace.basics.toml .aerospace.dvorak.toml > .aerospace.toml
  echo Dvorak
else
  cp .aerospace.basics.toml .aerospace.toml
  echo US
fi

aerospace reload-config
