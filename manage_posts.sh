#!/bin/bash

# Blog Post Management Script
# Allows you to unpublish, archive, or delete blog posts

POSTS_DIR="posts"
ARCHIVE_DIR="posts/_archive"
UNPUBLISHED_DIR="posts/_unpublished"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Create directories if they don't exist
mkdir -p "$ARCHIVE_DIR"
mkdir -p "$UNPUBLISHED_DIR"

echo -e "${BLUE}=== Blog Post Manager ===${NC}\n"

# Function to list all posts
list_posts() {
    echo -e "${GREEN}Available blog posts:${NC}"
    echo ""
    local i=1
    find "$POSTS_DIR" -maxdepth 1 -name "*.qmd" ! -name "index.qmd" ! -name "_template.qmd" | while read -r file; do
        basename "$file"
    done | sort
    echo ""
}

# Function to unpublish a post
unpublish_post() {
    local file="$1"
    if [ ! -f "$file" ]; then
        echo -e "${RED}Error: File not found${NC}"
        return 1
    fi

    local filename=$(basename "$file")
    local dest="$UNPUBLISHED_DIR/$filename"

    mv "$file" "$dest"
    echo -e "${GREEN}✓ Post unpublished and moved to $UNPUBLISHED_DIR${NC}"
    echo -e "${YELLOW}Note: The post will not appear on your blog but is preserved${NC}"
}

# Function to archive a post
archive_post() {
    local file="$1"
    if [ ! -f "$file" ]; then
        echo -e "${RED}Error: File not found${NC}"
        return 1
    fi

    local filename=$(basename "$file")
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local dest="$ARCHIVE_DIR/${timestamp}_$filename"

    cp "$file" "$dest"
    rm "$file"
    echo -e "${GREEN}✓ Post archived to $dest${NC}"
    echo -e "${YELLOW}Note: A backup has been saved before removal${NC}"
}

# Function to permanently delete a post
delete_post() {
    local file="$1"
    if [ ! -f "$file" ]; then
        echo -e "${RED}Error: File not found${NC}"
        return 1
    fi

    local filename=$(basename "$file")
    echo -e "${RED}WARNING: This will permanently delete $filename${NC}"
    read -p "Are you ABSOLUTELY sure? Type 'DELETE' to confirm: " confirmation

    if [ "$confirmation" = "DELETE" ]; then
        rm "$file"
        echo -e "${GREEN}✓ Post permanently deleted${NC}"
    else
        echo -e "${YELLOW}Deletion cancelled${NC}"
    fi
}

# Function to restore an unpublished post
restore_post() {
    echo -e "${GREEN}Unpublished posts:${NC}"
    find "$UNPUBLISHED_DIR" -name "*.qmd" | while read -r file; do
        basename "$file"
    done
    echo ""
    read -p "Enter filename to restore: " filename

    local source="$UNPUBLISHED_DIR/$filename"
    local dest="$POSTS_DIR/$filename"

    if [ -f "$source" ]; then
        mv "$source" "$dest"
        echo -e "${GREEN}✓ Post restored to $POSTS_DIR${NC}"
    else
        echo -e "${RED}Error: File not found${NC}"
    fi
}

# Function to view archived posts
view_archives() {
    echo -e "${GREEN}Archived posts:${NC}"
    find "$ARCHIVE_DIR" -name "*.qmd" | while read -r file; do
        basename "$file"
    done
    echo ""
}

# Main menu
while true; do
    echo -e "${BLUE}What would you like to do?${NC}"
    echo "1) List all published posts"
    echo "2) Unpublish a post (hide but keep)"
    echo "3) Archive a post (backup and remove)"
    echo "4) Delete a post permanently"
    echo "5) Restore an unpublished post"
    echo "6) View archived posts"
    echo "7) Exit"
    echo ""
    read -p "Enter your choice (1-7): " choice
    echo ""

    case $choice in
        1)
            list_posts
            ;;
        2)
            list_posts
            read -p "Enter the filename to unpublish: " filename
            unpublish_post "$POSTS_DIR/$filename"
            echo ""
            ;;
        3)
            list_posts
            read -p "Enter the filename to archive: " filename
            archive_post "$POSTS_DIR/$filename"
            echo ""
            ;;
        4)
            list_posts
            read -p "Enter the filename to delete: " filename
            delete_post "$POSTS_DIR/$filename"
            echo ""
            ;;
        5)
            restore_post
            echo ""
            ;;
        6)
            view_archives
            ;;
        7)
            echo -e "${GREEN}Goodbye!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid choice. Please enter 1-7.${NC}"
            echo ""
            ;;
    esac
done
