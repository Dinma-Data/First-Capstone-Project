#!/bin/bash

# Script to automate the integration of separate .csv files into a single output file.

# Define folder paths. Only folder names are needed because the script runs in the root directory.
DATA_HUB="data-hub"  # Folder containing the .csv files to be integrated.
DB="db"              # Folder where the final output file will be stored.
OUTPUT_FILE="$DB"    # Full path to the output file.

# Clear the output file to prevent duplication and ensure the results are up-to-date.
> $OUTPUT_FILE

# Loop through all .csv files in the data-hub folder.
for FILE in $DATA_HUB/*.csv; do

    # Check if the current item is a file (not a folder or other type of object).
    if [ -f "$FILE" ]; then
        cat "$FILE" >> $OUTPUT_FILE  # Append the content of the file to the output file.
        echo "" >> $OUTPUT_FILE      # Add a newline to separate the files in the output.
    fi
done

# Print a success message once the integration is complete.
echo "Integration completed. Data saved to $OUTPUT_FILE."