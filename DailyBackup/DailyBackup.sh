#!/bin/bash

backup_folder=$1
archive=${2:-"$1/archive"}
backup_name="$(date +"%Y-%m-%d,%H-%M-%S")"
if [[ -d "$backup_folder" ]]; then
	mkdir -p "$archive"
	cd "$archive"
	tar -cvf "$backup_name.tar" "$backup_folder" > "log_"$backup_name".txt" 2>&1)
	if [[ $? -eq 0 ]]; then
		echo "Backup Complete at $(date)"
	else
		echo "Backup failed, please check: $archive/log_$backup_name.txt"
	fi 
else
	echo "Error: '$backup_folder' does not exits"
	exit 1
fi

