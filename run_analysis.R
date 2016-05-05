library(dplyr)
setwd("C:/Users/Kristin/Desktop/Coursera/data-cleaning/final project")
fileUrl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "HarData.zip")
unzip("HarData.zip")

# we have 3 sets of files in Train and Test directories that need to be merged
# start with the subject files - we will use rbind to combine the tables

subjtrain <- read.table('./UCI HAR Dataset/train/subject_train.txt')
subjtest <- read.table('./UCI HAR Dataset/test/subject_test.txt')
subj <- rbind(subjtrain, subjtest)

# next the X files
xtrain <- read.table('./UCI HAR Dataset/train/X_train.txt')
xtest <- read.table('./UCI HAR Dataset/test/X_test.txt')
x <- rbind(xtrain, xtest)

# next the y files
ytrain <- read.table('./UCI HAR Dataset/train/y_train.txt')
ytest <- read.table('./UCI HAR Dataset/test/y_test.txt')
y <- rbind(ytrain, ytest)

# extract feature table to identify measurements that have mean and std in title
features <- read.table('./UCI HAR Dataset/features.txt')
meanAndStd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
#meanAndStd has teh row numbers corresponding to "mean" and "Std" measurements

#select columns that haev mean and std data
xMeanAndStd <- select(x, meanAndStd)

# clean up features and then use as column names
names(xMeanAndStd) <- features[meanAndStd, 2]
# Eliminate all the () brackets for cleaner titles
names(xMeanAndStd) <- gsub("\\(|\\)", "", names(xMeanAndStd))

# clean up y tables
activity <- read.table('./UCI HAR Dataset/activity_labels.txt')
#eliminate _
activity[, 2] <- gsub("_", "", activity[, 2])
# replace with lower case 
activity[, 2] <- tolower(activity[, 2])
# replace y with actual activity instead of number
y[, 1] = activity[y[, 1], 2]

# give Subject column name to Subj file
colnames(subj) <- "subject"
# give y its column name - activity
colnames(y) <- "activity"

# now combine all columns
cleandata <- cbind(subj, xMeanAndStd, y)
setwd("C:/Users/Kristin/Desktop/Coursera/data-cleaning/final project")
write.table(cleandata, file = "./cleandata.txt", row.names = FALSE)

# calculate averages and store
avgactivity <- aggregate(x=cleandata, by=list(activity=cleandata$activity, subj=cleandata$subject), FUN=mean)
avgactivity <- avgactivity[, !(colnames(avgactivity) %in% c("subj", "activity"))]
write.table(avgactivity, './avgactivity.txt', row.names = FALSE)
