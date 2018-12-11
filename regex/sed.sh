#! /usr/bin/env bash

# https://unix.stackexchange.com/questions/24140/return-only-the-portion-of-a-line-after-a-matching-pattern
# http://www.grymoire.com/Unix/Sed.html
# https://www.mankier.com/1/sed

filename=$(cat testfile.txt | sed -n "s/^Saving to: ‘//p" | sed "s/’//")
echo "Finished downloading: $filename"

