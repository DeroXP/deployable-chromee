#!/bin/bash

# Specify the base directories to search for Chrome-related files
CHROME_DIRS=(
    "$HOME/.config/google-chrome"
    "$HOME/.config/chromium"
)

# Function to find and remove singleton files
remove_singleton_files() {
    local dir="$1"
    
    # Find all files within the directory and subdirectories
    find "$dir" -type f | while read -r file; do
        # Get the directory of the current file
        file_dir=$(dirname "$file")
        
        # Count the number of files in the directory
        file_count=$(find "$file_dir" -maxdepth 1 -type f | wc -l)
        
        # If the directory contains only one file, remove it
        if [ "$file_count" -eq 1 ]; then
            echo "Removing singleton file: $file"
            rm "$file"
        fi
    done
}

# Iterate over specified Chrome-related directories
for chrome_dir in "${CHROME_DIRS[@]}"; do
    if [ -d "$chrome_dir" ]; then
        echo "Checking directory: $chrome_dir"
        remove_singleton_files "$chrome_dir"
    else
        echo "Directory not found: $chrome_dir"
    fi
done

echo "Singleton file removal process completed."
