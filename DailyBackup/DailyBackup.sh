#!/bin/bash

backup_folder=$1
archive=$2
echo "${archive:-"${1}"}"
backup_name="$(date +"%Y-%m-%d,%H-%M-%S")"
if [[ -d "$backup_folder" ]]; then
	archive_path="${archive:-"${1}/archive"}"
	mkdir -p "$archive_path"
	$(cd "$archive_path"; tar -cvf "$backup_name" "$backup_folder" > "log_"$backup_name".txt" 2>&1) 
fi
