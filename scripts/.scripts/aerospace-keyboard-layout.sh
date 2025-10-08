#!/bin/sh
LAYOUT=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | egrep -w 'KeyboardLayout Name' | sed -E 's/^.+ = \"?([^\"]+)\"?;$/\1/')
if [ "Dvorak" = "$LAYOUT" ]; then
  MAPPING="dvorak"
else
  MAPPING="qwerty"
fi
echo Switching to $MAPPING
sed -i'' -e "s/^key-mapping.*$/key-mapping.preset = '$MAPPING'/" ~/Source/dotfiles/aerospace/.aerospace.toml
aerospace reload-config
