#!/bin/bash

LATEST="$1"

echo "" > index.md
sort -r $LATEST -o $LATEST

while read line; do
  text="`echo $line | cut -c 10-`"
  link="`echo $text | tr ' ' '-' | tr '[:upper:]' '[:lower:]'`"
  echo "##[$text](/$link)" >> index.md
done < $LATEST

