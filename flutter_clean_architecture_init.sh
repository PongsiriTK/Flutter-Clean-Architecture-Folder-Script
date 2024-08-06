#!/bin/bash

# Define the base path
BASE_PATH="lib"

# Define the folders and subfolders
FOLDERS=(
  "$BASE_PATH/data datasources models repositories"
  "$BASE_PATH/presentation atoms molecules organisms"
  "$BASE_PATH/repository usecases entities repositories"
  "$BASE_PATH/domains"
  "$BASE_PATH/core constants enums extensions"
)

# Create the folders, subfolders, and .dart files
for ENTRY in "${FOLDERS[@]}"; do
  IFS=' ' read -r -a PARTS <<< "$ENTRY"
  FOLDER="${PARTS[0]}"
  SUBFOLDERS="${PARTS[@]:1}"
  mkdir -p "$FOLDER"
  # Create a .dart file with the folder name
  PARENT_FILE="$FOLDER/$(basename "$FOLDER").dart"
  touch "$PARENT_FILE"
  for SUBFOLDER in $SUBFOLDERS; do
    SUBFOLDER_PATH="$FOLDER/$SUBFOLDER"
    mkdir -p "$SUBFOLDER_PATH"
    # Create a .dart file with the subfolder name
    CHILD_FILE="$SUBFOLDER_PATH/$(basename "$SUBFOLDER_PATH").dart"
    touch "$CHILD_FILE"
    # Add export statement to the parent .dart file
    echo "export './$SUBFOLDER/$(basename "$SUBFOLDER").dart';" >> "$PARENT_FILE"
  done
done

echo "Folders and .dart files created successfully, with export statements added to parent .dart files."
