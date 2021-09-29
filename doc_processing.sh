# For Factiva exports
# Insert line seperator between articles

function factiva {
  filename=$(basename -- "$1")
  # extension="${filename##*.}"
  filename="${filename%.*}"
  less $1 > sed -z -i \
  "s/\nDocument/\n..............................................................................................\n\nDocument/g" \
  > "${filename}.txt"
}
