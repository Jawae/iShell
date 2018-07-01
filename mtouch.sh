# make multiple files
echo "Create multiple files with specific patterns"
read -p "Choose files type: 1. common-xx; 2. xx-common; 3. common-xx-common: " type

# get file structure
if [ $type -eq 1 ] || [ $type -eq 2 ]; then
    read -p "common part text: " common
    read -p "special part text: " special
else
    read -p "common part 1 text: " common_1
    read -p "common part 2 test: " common_2
    read -p "special part text: " special
fi

# make file
for i in $special; do
    if [ $type -eq 1 ]; then
	fname=$common$i
    elif [ $type -eq 2 ]; then
	fname=$i$common
    else
	fname=$common_1$i$common_2
    fi
    touch $fname
done
	
