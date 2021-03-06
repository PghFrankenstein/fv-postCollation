#!/bin/bash
# 2019-04-14 ebb: A shell script to separate msColl constructed edition files from other output edition files in the Frankenstein Variorum. 

# First, delete previous directories made by running this script. Then, copy all of P5-trimmedWS into P5-print-tws.
rm -R P5-print-tws  
rm -R P5-MS-tws
cp -R P5-trimmedWS P5-print-tws

# Then, find and move msColl files out into their own directory, named P5-MS-tws, and remove P5 prefix from MS edition filenames.

STRING="fMS"
mkdir P5-MS-tws
for i in P5-print-tws/P5-$STRING*.xml
do   
  mv $i P5-MS-tws/${i##*/P5-}
done

# Remove P5 prefix from files in P5-print directory
for i in P5-print-tws/*.xml
do
  mv $i P5-print-tws/${i##*/P5-}
done 

# Copy separate directories to fv-data repo
cp -R P5-print-tws/*.xml ../../fv-data/variorum-chunks-tws
cp -R P5-MS-tws/*.xml ../../fv-data/reseqMS-chunks-tws