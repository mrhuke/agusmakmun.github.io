#!/bin/bash
# Covnvert a file to a markdown file in Jekyll. The new file name will follow
# the format like 2016-07-31-filename.markdown. A header will be added to the
# file content. The output file will be saved in the current directory.
# 
# ./convert_to_posts.sh input.txt output_folder title short_description 

readonly input_file=$1
readonly output_folder=$2
readonly title=$3
readonly desc=$4

# Generate a file name following the format 2016-07-31-file-name.markdown
readonly current_date=`date +%Y-%m-%d`
readonly current_time=`date +%H:%M:%S`
readonly time_zone=`date +%z`
readonly new_file_name=$output_folder/$current_date-$title.markdown
echo "The new file name is $new_file_name"

# Add header to existing file
header="---\nlayout=post\ntitle:\"$title\"\ndate: $current_date $current_time $time_zone\ncategories: [cpp]\n---"
echo -e "Adding\n$header"
echo -e $header | cat - $input_file > $new_file_name
echo "Done."
