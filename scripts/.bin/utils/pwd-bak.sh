#!/bin/bash

pattern='Passwörter-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}\.kdbx'

current=~/Passwörter.kdbx
latest_backup=~/.pwd-bak/$(ls ~/.pwd-bak/ | grep -E $pattern - | sort | tail -n1)

if ! cmp --quiet $current $latest_backup 
then
	cp $current ~/Sync/Passwörter.kdbx
	bak_location=~/.pwd-bak/$(date '+Passwörter-%Y-%m-%d.kdbx')
	cp $current $bak_location
	echo "Copied Password Database."
else
	echo "Password Database unchanged. Not copying."
fi

