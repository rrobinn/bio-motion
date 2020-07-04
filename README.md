# bio-motion
Code for biological motion eye-tracking project

# Processing Scripts

## FixCounts_BioMotion.m  
This code reads in eye-tracking .mat files in a specified directory (`matFileDir`). It reads all files listed in text files (`particList.txt`).  These inputs can be edited in the first few lines of the script.  

It provides summaries of the following metrics for each movie:  

Variable Name | Description
------------- | -------------
mov | Movie name
part | Part 1, Part 2, Whole movie 
include | Whether to include this section based on <80% missing data.
saccCount | Number of frames flagged as saccades
missingCount | Number of frames flagged as missing
blinkCount | Number of frames flagged as blinks
fp1Count | Number of frames flagged as fixating on the upright point-light animation
fp2Count | Number of frames flagged as fixating on the inverted point-light animation

## Balance_Anim.m  
For some analyses, we want to make sure that for each eye-tracking sesison, we are analyzing data from an equal number of movies 
with the upright animation on the left side of the screen as the right side of the screen to make sure our results are not biased by side biases.
This script takes the output from `fixCounts_BioMotion.m`, and provides a balanced dataset (equal # of movies with the upright figure on the right as the left).  If there are more left than right movies, the script will drop the right movie with the least amount of data.
