# Getting-and-Cleaning-Data-2
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

Plan for project: Create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set. Extracts only the measurements on the mean and standard deviation for each measurement. Uses descriptive activity names to name the activities in the data set Appropriately labels the data set with descriptive variable names. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

run_analysis.R steps: 
1. extract X, y and Subj files from UCI HAR zip 
2. use rbind to combine Test and Train version sof X, y and subj 
3. Extract feature.txt from zip file 
4. Use grep to identify measurements that have mean and std in title - these are the columns that you need to select 
5. Use select() to extract above columns 6. use colnames to give sensible column titles (use gsub to clean titles by removing unnescessary brackets) 
6. Clean up y table - use actual activity instead of number 
7. clean up columns names for y and subj - replace with activity and subject using colnames() 
8. use cbind to combine subject, x and y data with clean columns titles 
9. use write.table to creat cleandata.txt file 
10. calculate averages by activity and subject and store in avgactivity.txt with write.table function

