#!/bin/bash

# Quick script to unpublish a post
# Usage: ./unpublish.sh post-filename.qmd

POSTS_DIR="posts"
UNPUBLISHED_DIR="posts/_unpublished"

# Create unpublished directory if it doesn't exist
mkdir -p "$UNPUBLISHED_DIR"

if [ -z "$1" ]; then
    echo "Usage: ./unpublish.sh <filename>"
    echo ""
    echo "Available posts:"
    find "$POSTS_DIR" -maxdepth 1 -name "*.qmd" ! -name "index.qmd" ! -name "_template.qmd" -exec basename {} \;
    exit 1
fi

FILENAME="$1"
SOURCE="$POSTS_DIR/$FILENAME"

if [ ! -f "$SOURCE" ]; then
    echo "Error: Post '$FILENAME' not found in $POSTS_DIR"
    exit 1
fi

mv "$SOURCE" "$UNPUBLISHED_DIR/$FILENAME"
echo "✓ Post unpublished: $FILENAME"
echo "  Moved to: $UNPUBLISHED_DIR"
echo ""
echo "To restore later, run: ./publish.sh $FILENAME"
