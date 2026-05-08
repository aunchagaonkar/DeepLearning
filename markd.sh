#!/bin/bash

# Directory containing PDFs
PDF_DIR="./"

# Output directory for markdown files
MD_DIR="./CS7015_Markdown"

# markitdown executable
MARKITDOWN="/home/ameya/Documents/College/Sem8/Deep Learning/.venv/bin/markitdown"

# Create output directory
mkdir -p "$MD_DIR"

# Check if markitdown exists
if [ ! -x "$MARKITDOWN" ]; then
    echo "Error: markitdown not found or not executable:"
    echo "$MARKITDOWN"
    exit 1
fi

# Convert all PDFs
for pdf in "$PDF_DIR"/*.pdf; do
    [ -e "$pdf" ] || continue

    filename=$(basename "$pdf" .pdf)
    output="$MD_DIR/${filename}.md"

    echo "Converting $pdf -> $output"

    "$MARKITDOWN" "$pdf" > "$output"
done

echo "All PDFs converted to Markdown."