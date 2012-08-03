#!/bin/bash

rm *.png
rm *.mov

for number in {1..10}
do
	for type in "base" "bs" "true" "solbs" "bar" "solbar" "misc"
	do
		echo "$number and $type"
		convert -size 640x480 xc:black -fill white -stroke white -pointsize 100 -gravity center -draw "text 0,0 \"$number $type\" " "$number-$type.jpg"
		ffmpeg -loop 1 -f image2 -i "$number-$type.jpg" -r 25 -vframes 250 -an -vcodec png "$number-$type.mov"
	done	
done