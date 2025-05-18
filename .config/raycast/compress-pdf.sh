#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Compress PDF
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🗜️
# @raycast.argument1 { "type": "text", "placeholder": "PDF_PATH" }

# Documentation:
# @raycast.description compress pdf with ghostscript
# @raycast.author naokiiida
# @raycast.authorURL https://raycast.com/naokiiida

PDF_PATH=$1
echo "Compressed $PDF_PATH!"
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=${PDF_PATH}_compressed.pdf ${PDF_PATH}.pdf
