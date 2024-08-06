#!/bin/bash

# Define the base path
BASE_PATH="./lib"

# Define the folders and subfolders
declare -A FOLDERS=(
  ["$BASE_PATH/data"]="datasources models repositories"
  ["$BASE_PATH/presentation"]="atoms molecues organisms"
  ["$BASE_PATH/repository"]="usecases entities repositories"
  ["$BASE_PATH/domains"]=""
  ["$BASE_PATH/core"]="constants enums extensions"
)

# Create the folders, subfolders, and .dart files
for FOLDER in "${!FOLDERS[@]}"; do
  mkdir -p "$FOLDER"
  # Create a .dart file with the folder name
  touch "$FOLDER/$(basename $FOLDER).dart"
  for SUBFOLDER in ${FOLDERS[$FOLDER]}; do
    SUBFOLDER_PATH="$FOLDER/$SUBFOLDER"
    mkdir -p "$SUBFOLDER_PATH"
    # Create a .dart file with the subfolder name
    touch "$SUBFOLDER_PATH/$(basename $SUBFOLDER_PATH).dart"
  done
done

echo "Folders and .dart files created successfully."
