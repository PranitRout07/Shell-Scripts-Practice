#!/bin/bash

delete_old_files() {
    find /demo* -mtime +7 -exec rm {} \;
}

# Main function
main() {
    # Check directory exists or not
    if [ ! -d "/path/to/delete" ]; then
        echo "Error: Directory '/demo' not found."
        exit 1
    fi
    
    # Delete old files
    delete_old_files
    
    # Check if there was an error during file deletion
    if [ $? -ne 0 ]; then
        echo "Error: Failed to delete files."
        exit 1
    fi
    
    echo "Old files deleted successfully."
}

# Execute the main function
main

# Schedule script to run daily at midnight
(crontab -l ; echo "0 0 * * * /bin/bash $0") | crontab -
