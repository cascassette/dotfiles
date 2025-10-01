#!/bin/sh

TMP_FILE=/tmp/gitlog

git log --pretty=format:"%h %<(8,trunc)%an %<(12,trunc)%ad %s" --date=relative --abbrev-commit --follow $1 > $TMP_FILE && echo "" >> $TMP_FILE && cat $TMP_FILE
