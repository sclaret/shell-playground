#! /usr/bin/env bash

function process_lines {
  while read pattern line; do
    test_regex $pattern $line
    echo
  done
}


# Note: set pattern in a variable, to avoid quoting problems
# Tips: to debug, add match groups
function test_regex {
  echo "'$1' =~ '$2': "
  [[ "$1" =~ $2 ]]
  case $? in
    0) echo "Match: '${BASH_REMATCH[@]}'"
       ;;
    1) echo "NO MATCH"
       ;;
    2) echo "Error: regular expression is syntactically incorrect."
       ;;
    *) echo "Unknown error."
       ;;
  esac
}

# test_regex '\u@\h:\W$ ' '^\\u@\\h:\\W\$ $'

p='^(/Volumes/[^/]+)(.*)$'
test_regex /Volumes/seagate_hdd/restic-utils $p
process_lines <<EOF
/home/sclaret $p
/Volumes/seagate_hdd/restic-utils $p
/Volumes/seagate_hdd/restic-utils/ $p
/Volumes/seagate_hdd/restic-utils/lib $p
/Volumes/seagate_hdd/restic-utils/lib/ $p
/Volumes/seagate_hdd/ $p
/Volumes/seagate_hdd $p
/Volumes/seag $p
/Volumes/a $p
/Volumes/ $p
/Volumes $p
/volumes/seag $p
EOF
