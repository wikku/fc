#!/usr/bin/env bash

while [[ 1 ]]
do
	clear
	abella -i $1 < /dev/null
	inotifywait -e close_write $1 2>/dev/null
done
