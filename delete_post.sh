#!/bin/bash

# Script to safely delete a post with backup
# Usage: ./delete_post.sh post-filename.qmd

POSTS_DIR="posts"
ARCHIVE_DIR="posts/_archive"

# Create archive directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

if [ -z "$1" ]; then
    echo "Usage: ./delete_post.sh <filename>"
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

echo "⚠️  WARNING: This will remove '$FILENAME' from your blog"
echo "   (A backup will be saved in $ARCHIVE_DIR)"
echo ""
read -p "Are you sure? (yes/no): " confirmation

if [ "$confirmation" = "yes" ] || [ "$confirmation" = "y" ]; then
    # Create timestamped backup
    TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    BACKUP="$ARCHIVE_DIR/${TIMESTAMP}_$FILENAME"

    cp "$SOURCE" "$BACKUP"
    rm "$SOURCE"

    echo "✓ Post deleted: $FILENAME"
    echo "  Backup saved: $BACKUP"
else
    echo "Cancelled - no changes made"
fi
