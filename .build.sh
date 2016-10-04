#!/bin/bash

INPUT="$1"
OUTPUT="$2"
HEADER="$3"
FOOTER="$4"
LATEST="$5"
TITLE="`dirname $INPUT | tr '[:upper:]' '[:lower:]'`"

if [ $TITLE = "." ]
then
  TITLE="index"
fi

echo "Building $OUTPUT"
sed "/{title}/{s/{title}/$TITLE/;s/-/\ /g;}" $HEADER > $OUTPUT
markdown $INPUT >> $OUTPUT
cat $FOOTER >> $OUTPUT

