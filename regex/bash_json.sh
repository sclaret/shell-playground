#! /usr/bin/env bash

o2="{\"access_token\":\"gho_123abcREMOVEDcba321\",\"token_type\":\"bearer\",\"scope\":\"admin:public_key\"}"

echo $o2

if [[ $o2 =~ access_token\":\"([^\"]*)\" ]]; then
	echo ${BASH_REMATCH[0]}
	echo ${BASH_REMATCH[1]}
	echo ${BASH_REMATCH[2]}
fi
