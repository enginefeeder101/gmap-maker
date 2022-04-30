#!/bin/bash
cd -P -- "$(dirname -- "$0")/Freizeitkarte-Entwicklung"
FILES=$(grep -P "\[\s*\d{4},\s*'OpenFietsMap_" mt.pl | awk '{print $3}' | cut -c2- | rev | cut -c3- | rev)
cd poly
for FILE in $FILES; do
  ORIG=${FILE//OpenFietsMap_/Freizeitkarte_}
  [ ! -f $FILE.poly ] && ln -sf $ORIG.poly $FILE.poly
done
