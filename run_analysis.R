#COURSE PROJECT COURSERA GETTING & CLEANING DATA
#Gregory Verleysen

#this script performs the following steps:
#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names. 
#5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#----------------------------------------------------------------------------------------------------------------------------------------------------------

#set working directory
setwd("~/COURSERA/Getting and cleaning data/Course Project")

#read in data
training <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
training[,562] <- read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
training[,563] <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

testing <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
testing[,562] <- read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
testing[,563] <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

activityLabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

#read features and change the feature names
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

#merge the training and test sets together
CompleteData = rbind(training, testing)

#get only the data on mean and std. dev.
RelevantData <- grep(".*Mean.*|.*Std.*", features[,2])
#reduce the features to what is relevant
features <- features[RelevantData,]
#add the subject and activity variables
RelevantData <- c(RelevantData, 562, 563)
#remove unwanted columns from CompleteData
CompleteData <- CompleteData[,RelevantData]
#add features to data
colnames(CompleteData) <- c(features$V2, "Activity", "Subject")
colnames(CompleteData) <- tolower(colnames(CompleteData))

currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
  CompleteData$activity <- gsub(currentActivity, currentActivityLabel, CompleteData$activity)
  currentActivity <- currentActivity + 1
}

CompleteData$activity <- as.factor(CompleteData$activity)
CompleteData$subject <- as.factor(CompleteData$subject)

tidy = aggregate(CompleteData, by=list(activity = CompleteData$activity, subject=CompleteData$subject), mean)
# Remove the subject and activity column, since a mean of those has no use
tidy[,90] = NULL
tidy[,89] = NULL
write.table(tidy, "tidy.txt", sep="\t")