#!/bin/sh

TMP_FILE=/tmp/gitlog

git log --pretty=format:"%h %an %ad %s" --date=relative --abbrev-commit --follow $1 > $TMP_FILE && echo "" >> $TMP_FILE && cat $TMP_FILE
