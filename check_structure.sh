#!/bin/bash
# This script checks that the repository has the correct file structure

# Expected files in the repository root
expected_files=("index.html" "styles.css" "script.js")

# Expected directories in the repository root
expected_dirs=("images" "music")

status=0

echo "Checking repository structure..."

# Check for expected files
for file in "${expected_files[@]}"; do
    if [ ! -f "$file" ]; then
        echo "ERROR: Missing file: $file"
        status=1
    else
        echo "Found file: $file"
    fi
done

# Check for expected directories
for dir in "${expected_dirs[@]}"; do
    if [ ! -d "$dir" ]; then
        echo "ERROR: Missing directory: $dir"
        status=1
    else
        echo "Found directory: $dir"
    fi
done

# If the images directory exists, check for the required image files
if [ -d "images" ]; then
    expected_images=("cheese1.png" "cheese2.jpg" "cheese3.jpg" "rat1.jpg" "rat2.jpg" "explosion.gif" "fire_background.gif")
    for img in "${expected_images[@]}"; do
        if [ ! -f "images/$img" ]; then
            echo "ERROR: Missing image: images/$img"
            status=1
        else
            echo "Found image: images/$img"
        fi
    done
fi

# If the music directory exists, check for the required music file
if [ -d "music" ]; then
    if [ ! -f "music/background.mp3" ]; then
        echo "ERROR: Missing music file: music/background.mp3"
        status=1
    else
        echo "Found music file: music/background.mp3"
    fi
fi

if [ $status -eq 0 ]; then
    echo "Repository structure is correct."
else
    echo "Repository structure is incorrect. Please refer to the instructions above."
fi
