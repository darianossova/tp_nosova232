#!/bin/bash
file_path="$1"
output_dir="$2"
file_name=$(basename "$file_path")

find $1 -type f | while read file;
do

	if [ -e "$output_dir/$(basename $file)" ]; then
		base_name="$(basename ${file%.*})"
        	extension="${file##*.}"
        	new_file_name="${base_name}_$(date +%s).${extension}"
		cp "$file" "$output_dir/$new_file_name"
	else
        	cp "$file" "$output_dir/$(basename $file)"
	fi
done
