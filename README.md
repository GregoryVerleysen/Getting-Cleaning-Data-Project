Getting and Cleaning Data Course Project ReadMe
=================================================
The file contains a description of the data, the variables and operations performed on the data.

Data URL:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data zip file:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

R script run_analysis.R performs the following operations: 
   
1. Read X_train.txt, y_train.txt and subject_train.txt from the "./data/train" folder and combine them in the dataset Training. 
2. Read X_test.txt, y_test.txt and subject_test.txt from the "./data/test" folder and combine them in the dataset testing.
3. Read activity_labels.txt from the “./data” folder and store the activity variable in the dataset activityLabels.
4. Read features.txt from the “./data” folder and store them in the dataset features.
5. Change the names of features into more appropriate names.
6. Merge the training and testing datasets, from step 1 and 2, into dataset CompleteData.
7. Limit the data to mean and standard deviation
8. Add subject and activity
9. Remove unwanted data
10. Add features to data
11. Generate a second independent tidy data set with the average of each measurement for each activity and each subject. 
12. Write the tidy dataset out to tidy.txt. 

  

