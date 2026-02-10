#!/bin/bash

REMOVE_PUBLIC="s/public\///"
OUTPUT=

if [[ -z "$WEBSITE" ]]; then
  echo "\$WEBSITE variable not defined" >&2
  exit 0
fi

VERSION=$(fd -t d "\d\.\d\.\d-beta" | sed -e $REMOVE_PUBLIC | sort -r | fzf --disabled --no-sort)

if [[ -z "$VERSION" ]]; then
  echo "No \$VERSION chosen" >&2
  exit 0
fi

for FILE in public/$VERSION*; do
  FN=$(echo $FILE | sed -e $REMOVE_PUBLIC)
  if [[ $FN == *"mac"* ]]; then
    OS=macOS
  elif [[ $FN == *"win"* ]]; then
    OS=Windows
  fi
  OUTPUT+="$OS: $WEBSITE$FN"$'\n'
done

echo Copying to clipboard:
echo "$OUTPUT"
echo "$OUTPUT" | pbcopy
