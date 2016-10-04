#!/bin/bash

LATEST=".latest.txt"
TITLE="$1"
DIR="`echo "$TITLE" | tr ' ' '-' | tr '[:upper:]' '[:lower:]'`"
DATE="`date '+%y-%m-%d'`"

echo "$DATE $TITLE" >> "$LATEST"
mkdir "$DIR"
$EDITOR "$DIR/index.md"

