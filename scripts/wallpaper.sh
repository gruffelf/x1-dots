#!/bin/bash
Display=(~/.config/walls/*) 
 
#Create a variable for each display using a random number
#Random will automatically be equal to the number of files in your wallpaper folder
       
x=$((0 + RANDOM % ${#Display[@]}))  
       
#Optional conditional test to prevent the same wallpaper displaying on both displays
#If you don't care about this, or only have a single display, skip these lines
 
#Parse array for files to be displayed on each display and display them
#Use your system's display names here, these are mine
 
swaymsg output 'eDP-1' bg "${Display[$x]}" fill
