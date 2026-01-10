#!/bin/bash

# Script to create a new blog post from template
# Usage: ./new_post.sh "Post Title" [filename]

if [ -z "$1" ]; then
    echo "Usage: ./new_post.sh \"Post Title\" [filename]"
    echo "Example: ./new_post.sh \"My Awesome Post\" my-awesome-post"
    exit 1
fi

TITLE="$1"
TODAY=$(date +%Y-%m-%d)

# Generate filename from title if not provided
if [ -z "$2" ]; then
    # Convert title to lowercase, replace spaces with hyphens
    FILENAME=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g' | sed 's/[^a-z0-9-]//g')
else
    FILENAME="$2"
fi

FILEPATH="posts/${FILENAME}.qmd"

# Check if file already exists
if [ -f "$FILEPATH" ]; then
    echo "Error: File $FILEPATH already exists!"
    exit 1
fi

# Create new post from template
cp posts/_template.qmd "$FILEPATH"

# Replace placeholders with actual values
sed -i.bak "s/TITLE/$TITLE/g" "$FILEPATH"
sed -i.bak "s/DATE/$TODAY/g" "$FILEPATH"

# Remove backup file created by sed
rm "${FILEPATH}.bak"

echo "Created new post: $FILEPATH"
echo "Title: $TITLE"
echo "Date: $TODAY"
echo ""
echo "Edit your post with: open $FILEPATH"
