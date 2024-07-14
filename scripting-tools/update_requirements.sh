#!/bin/bash

# Exit on error
set -e

# Print a message
echo "Starting the installation of packages from all requirements.txt files in subdirectories..."

# Find all requirements.txt files in subdirectories and install packages
find .. -name "requirements.txt" | while read req_file; do
    # Print the found requirements.txt file
    echo "Found $req_file"
    
    # Check if the file is readable
    if [ -r "$req_file" ]; then
        echo "$req_file is readable."
    else
        echo "$req_file is not readable. Skipping."
        continue
    fi
    
    # Print the directory of the requirements.txt file
    dir=$(dirname "$req_file")
    echo "Processing $req_file in $dir..."
    
    # Change to the directory containing requirements.txt
    pushd "$dir" > /dev/null
    
    # Install the packages using pip and log the output
    pip install -r requirements.txt
    
    # Go back to the original directory
    popd > /dev/null
    
    echo "Packages installed successfully in $dir."
done

echo "Finished installing packages from all requirements.txt files."
