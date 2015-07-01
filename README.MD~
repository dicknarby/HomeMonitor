The goal of this project is to monitor my front door, and take pictures when people go in or out. The goal is to do this while missing no entry or egress events, and recording as few extrenuous images as possible. Success will be meassured along in those two categories, as well as in system resourse usage, stability, and eligance.

My first attempt at a solution is a continously excecuting bash script. This script uses raspistill to get the images, and it saves them into a folder called "monitor_pics." Then it calls a C# class that compares the two most recent images and deletes the uninteresting ones.

TO RUN:
1) ensure that mono-complete is installed and the camera is enabled
2) ensure that ImageChecker.cs and monitor.sh are in the active directory
3) run "./monitor.sh"
4) use control c to exit, and check out the pictures in monitor_pics
