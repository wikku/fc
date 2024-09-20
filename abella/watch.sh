#!/usr/bin/env bash

while [[ 1 ]]
do
	clear
	abella -i $1 < /dev/null \
	| awk '/=====/{found=1; count=10} !found || count-- > 0 {print}'
	inotifywait -e close_write $1 2>/dev/null
done
