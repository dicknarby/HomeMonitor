#!/bin/bash

echo "Compiling imageChecker"
gmcs -r:System.Drawing ImageChecker.cs

echo "The monitor is now activated"

DATE=$(date +"%Y-%m-%d--%H-%M-%S")
raspistill -w 640 -h 480 -q 10 -e jpg -n -t 1 -vf -o ./monitor_pics/$DATE.jpg

echo "The monitor took a picture"

sleep 5

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

