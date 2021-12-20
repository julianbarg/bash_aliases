# For Factiva exports
# Insert line seperator between articles

# function factiva {
#   filename=$(basename -- "$1")
#   # extension="${filename##*.}"
#   filename="${filename%.*}"
#   less $1 > sed -z -i \
#   "s/\nDocument/\n..............................................................................................\n\nDocument/g" \
#   > "${filename}.txt"
# }

function factiva {
  sed -e 's=</div>=&</br>=g' -e 's=<span [^>]*>=&<h2>=g' -e 's=^</span>=&</h2>=g' $1 > $2
}
