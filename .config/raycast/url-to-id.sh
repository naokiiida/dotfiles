#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title url to id
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "url" }

# Documentation:
# @raycast.description Extract id from Google sheets url
# @raycast.author naokiiida
# @raycast.authorURL https://raycast.com/naokiiida

url=$1
# Extract UID from different Google URLs
# Examples:
# "https://docs.google.com/spreadsheets/d/<UID>/edit?gid=0#gid=0"
# "https://script.google.com/home/projects/<UID>/edit"
# "https://script.google.com/d/<UID>/edit?usp=sharing"
# "https://drive.google.com/drive/folders/<UID>?usp=share_link"

# Extract the UID from the URL using a more comprehensive regex pattern
id=$(sed -E 's#.*/((d/|projects/|folders/|spreadsheets/d/)([^/?#]+)).*#\3#' <<< "$url")
echo $id
echo -n $id | pbcopy
