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
# url="https://docs.google.com/spreadsheets/d/1VPNAMe7NaO9sfsr0-tMu3lIPz1C63sXmQKS1uaGqxK4/edit?gid=0#gid=0"
# url="https://script.google.com/home/projects/<UID>/edit"
# echo "Google Sheet URL: "$1""
id=$(sed -E 's#.*/(spreadsheets/d/|projects/)([^/]+)/.*#\2#' <<< "$url")
echo $id
echo -n $id | pbcopy
# echo $id | tee /dev/tty | pbcopy
