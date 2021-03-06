#!/bin/bash

echo "Compiling ImageChecker"
gmcs -r:System.Drawing ImageChecker.cs

echo "Checking for monitor_pics directory"
if [ ! -d ./monitor_pics ]; then
	echo "Creating monitor_pics"
	mkdir monitor_pics
fi

echo "The monitor is now activated"

echo "The monitor is taking a picture"

DATE=$(date +"%Y-%m-%d--%H-%M-%S")
raspistill -w 640 -h 480 -q 10 -e jpg -n -t 1 -vf -o ./monitor_pics/$DATE.jpg

echo "The monitor took a picture"

sleep 4

while true; do

	cd monitor_pics
	latestImg=$(ls -t | head -1)
	cd ..

	echo "The monitor is taking a picture"
	
	DATE=$(date +"%Y-%m-%d--%H-%M-%S")
	raspistill -w 640 -h 480 -q 10 -e jpg -n -t 1 -vf -o ./monitor_pics/$DATE.jpg

	echo "The monitor took a picture"

	mono ImageChecker.exe ./monitor_pics/$latestImg ./monitor_pics/$DATE.jpg

	sleep 1

done

