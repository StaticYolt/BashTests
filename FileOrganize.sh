#!/bin/bash

DRY_RUN=false
directory="$1"

if [[ "$2" == "--dry-run" ]]; then
	echo "Activate Dry Run"
	DRY_RUN=true
fi
extentions=(.txt .png)
if [ -d "$directory" ]; then
	for ext in "${extentions[@]}"; do
		dir_name="${ext:1}"
		mkdir -p $directory/$dir_name
		echo "created directory: $dir_name"
		for file in "$directory"/*"$ext"; do
			[ -e "$file" ] || continue
			$DRY_RUN || mv "$file" "$dir_name"
			echo "$file has been moved to $ext"
		done
	done
else
	echo "Invalid directory: $directory"
	exit 1
fi
