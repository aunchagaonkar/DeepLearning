#!/bin/bash

# Base URL
BASE_URL="https://www.cse.iitm.ac.in/~miteshk/CS7015/Slides/Handout"

# Number of lectures
TOTAL=23

# Create output directory
mkdir -p CS7015_Handouts
cd CS7015_Handouts || exit

# Download all lecture PDFs
for i in $(seq 1 $TOTAL); do
    FILE="Lecture${i}.pdf"
    URL="${BASE_URL}/${FILE}"

    echo "Downloading $FILE ..."
    wget -c "$URL"
done

echo "All downloads completed."