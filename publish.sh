#!/bin/bash

# Quick script to publish/restore a post
# Usage: ./publish.sh post-filename.qmd

POSTS_DIR="posts"
UNPUBLISHED_DIR="posts/_unpublished"

if [ -z "$1" ]; then
    echo "Usage: ./publish.sh <filename>"
    echo ""
    echo "Unpublished posts:"
    if [ -d "$UNPUBLISHED_DIR" ]; then
        find "$UNPUBLISHED_DIR" -name "*.qmd" -exec basename {} \;
    else
        echo "  (none)"
    fi
    exit 1
fi

FILENAME="$1"
SOURCE="$UNPUBLISHED_DIR/$FILENAME"

if [ ! -f "$SOURCE" ]; then
    echo "Error: Post '$FILENAME' not found in $UNPUBLISHED_DIR"
    exit 1
fi

mv "$SOURCE" "$POSTS_DIR/$FILENAME"
echo "✓ Post published: $FILENAME"
echo "  Moved to: $POSTS_DIR"
echo ""
echo "Run 'quarto render' to rebuild your site"
