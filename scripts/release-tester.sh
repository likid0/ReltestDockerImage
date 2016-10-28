#!/bin/bash
curl lb >/dev/null 2>&1
if [ $? = 0 ] ; then
	for NUMBER in {1..80}
	do
		curl lb >/dev/null 2>&1
	done
else
	echo "Release tests FAILED"
	exit 1
fi
IPS=$(curl lb | grep IP | sort -u | wc -l)
if [ -n $IPS ] && [ $IPS -gt 2 ] ; then
	echo "Release tests passed OK"
else
	echo "Release tests FAILED"
	exit 1
fi
