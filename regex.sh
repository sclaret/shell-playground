#! /usr/bin/env bash

function test_regex {
  while read pattern line; do
    echo "$line =~ $pattern: "
    [[ $line =~ $pattern ]]
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
p=$pattern
# echo $p /Volumes/seagate_hdd/restic-utils | test_regex $pattern
# exit

test_regex <<EOF
$p /home/sclaret
$p /Volumes/seagate_hdd/restic-utils
$p /Volumes/seagate_hdd/restic-utils/
$p /Volumes/seagate_hdd/restic-utils/lib
$p /Volumes/seagate_hdd/restic-utils/lib/
$p /Volumes/seagate_hdd/
$p /Volumes/seagate_hdd
$p /Volumes/seag
$p /Volumes/a
$p /Volumes/
$p /Volumes
$p /volumes/seag
EOF
