#!/bin/bash

# setup_permissions.sh
# Automates the creation and securing of the research team's file system

echo "1. Building the dummy file structure..."
mkdir -p projects/drafts
touch projects/.project_x.txt
touch projects/regular_data.txt

echo "Securing .project_x.txt (Hidden File)..."
# REQUIREMENT: No write permissions for anyone. User & Group can read.
# LOGIC: Read = 4, Write = 2, Execute = 1.
# User gets 4 (Read). Group gets 4 (Read). Others get 0 (Nothing).
# Target 10-character string: -r--r-----
chmod 440 projects/.project_x.txt

echo "3. Securing drafts directory..."
# REQUIREMENT: Only the owner can access drafts and its contents.
# LOGIC: Owner gets 7 (4+2+1 = Read/Write/Execute). Group gets 0. Others get 0.
# Target 10-character string: drwx------
chmod 700 projects/drafts

echo "4. Removing write access for 'others' globally..."
# REQUIREMENT: Organization does not allow 'others' to have write access anywhere.
# LOGIC: 'o-w' means Others MINUS Write permission. '-R' does it recursively.
chmod -R o-w projects/

echo "--- PERMISSIONS VERIFICATION ---"
# Using -la to show all files (including hidden) in a long list format
ls -la projects/
