#!/bin/bash

# Check if directory is in args
if [ -z "$1" ]; then
	echo "Use: $0 <directory>"
	exit 1
fi

# Set directory to be organized
DIR="$1"

# Check if the directory exits
if [ ! -d "$DIR" ]; then
	echo "The directory does no exists: $DIR"
	exit 1
fi

# cd into the directory
cd "$DIR" || exit

# For each file in directory
for FILE in *; do

	# Check for a regular file
	if [ -f "$FILE" ]; then

		# Get the extension file
        	EXT="${FILE##*.}"

		# Create a directory with the extension name
		if [ ! -d "$EXT" ]; then
			mkdir "$EXT"
		fi

		# Move the fil
		mv "$FILE" "$EXT/"
	fi
done
echo "All files organized: $DIR"
