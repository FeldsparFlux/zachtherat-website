#!/bin/bash
# This script ensures that the required directories exist.
# It creates missing directories and reminds you where to put the necessary files.

# Create the "images" and "music" directories if they don't exist.
mkdir -p images
mkdir -p music

echo "Ensured that directories 'images' and 'music' exist."

cat <<'EOF'
Please make sure your repository structure looks like this:

Repository Root:
  ├── index.html
  ├── styles.css
  ├── script.js
  ├── images/
  │     ├── cheese1.png
  │     ├── cheese2.jpg
  │     ├── cheese3.jpg
  │     ├── rat1.jpg
  │     ├── rat2.jpg
  │     ├── explosion.gif
  │     └── fire_background.gif
  └── music/
        └── background.mp3

If any files are missing, please move or add them to the correct directories.
EOF
