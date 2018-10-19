#! /usr/bin/env bash

function test_regex {
  while read line; do
    echo "$line =~ $1: "
    [[ $line =~ $1 ]]
    case $? in
      0) echo "Match: ${BASH_REMATCH[@]}"
         ;;
      1) echo "NO MATCH";;
      2) echo "Error: regular expression is syntactically incorrect."
         ;;
      *) echo "Unknown error."
         ;;
    esac
    echo
  done
}

pattern="^(/Volumes/[^/]+)(.*)$"

# echo /Volumes/seagate_hdd/restic-utils | test_regex $pattern
# exit

test_regex $pattern <<EOF abc
/home/sclaret
/Volumes/seagate_hdd/restic-utils
/Volumes/seagate_hdd/restic-utils/
/Volumes/seagate_hdd/restic-utils/lib
/Volumes/seagate_hdd/restic-utils/lib/
/Volumes/seagate_hdd/
/Volumes/seagate_hdd
/Volumes/seag
/Volumes/a
/Volumes/
/Volumes
/volumes/seag
EOF
