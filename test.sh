#!/bin/bash
fname=README.md
call="awesome_bot $fname --skip-save-results --allow-redirect -w cryptrader,shields.io"
# cryptrader has a 5s ddos protection
# shields.io is the badge provider
out=$($call)
if [[ $out != *"No issues"* ]]; then
	echo $out
	echo "<<< Failed, retrying.. >>>"
	out=$($call)
fi

echo $out
if [[ $out != *"No issues"* ]]; then
	exit 1
else
	exit 0
fi
