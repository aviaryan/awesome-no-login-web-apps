#!/bin/bash
fname=README.md
call="awesome_bot $fname --skip-save-results --allow-redirect --allow-dupe --allow-ssl -w cryptrader,shields.io,codepen.io,similarsites.com,typeracer.com,agar.io,coolors.co,jsbin.com,flaticon.com,10minutemail.com,dub.sh,jango.com,curiousconcept.com,sendvid.com,telegra.ph,is.gd"
# cryptrader has a 5s ddos protection
# shields.io is the badge provider
# typeracer, agar.io, coolors, jsbin, flaticon, 10minutemail, jango return 403 to bots but work in browsers
# dub.sh and curiousconcept rate-limit bots with 429
# sendvid, telegra.ph, is.gd timeout for bots but work in browsers
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
