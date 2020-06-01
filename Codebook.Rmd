---
title: "CodeBook"
author: "Siyi Gu"
date: "6/1/2020"
output: html_document
---

## Information about the data
- The "step5_dataset.txt" dataset contains 180 observations (30 subject x 6 activities) of 68 variables in total;
- For each subject and each activity, there are 66 variables which are averages of each feature mean and standard deviation measurement over each subject and activity combination associted with it.

## Variables
1) subject_id shows the identification number for each subject, there are 30 different subjects from 1 to 30;
2) activity_label shows the possible acticity types, which can take 6 different types namely: walking, walking_upstairs, walking_downstairs, laying, sitting, and standing;
3) The following 66 variables are averages of each feature mean and standard deviation measurement over each subject and activity combination, the specific names of these features are as follows:
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

**Note**:the -XYZ will be seprated to three different variables, for example tBodyAcc-XYZ is actually three different variables tBodyAcc-X, tBodyAcc-Y,and tBodyAcc-Z, there are 24 (8 XYZ variables)+9=33 varibles in the above list and since there are mean and standard deviation, there are 33*2=66 variables in total.
In the column names, there are .mean and .std to signify mean or standard deviation measurement for each variable.

## Transformation from raw data
- The information from this data set are from the following raw data sets:
1)subject_test.txt
2)subject_train.txt--for subject_id information
3)X_test.txt
4)X_train.txt --for feature measurements
5)Y_test.txt
6)Y_train.txt --for activity type information
7)features.txt --for feature names
- After combining both train and test data set with information of subject id, activity type(label), all feature measurements, I selected only mean and standard deviation measurements and excluded others;
- Each mean or standard deviation meansurement was averaged over each subject and each activity type, and was the value reported in this data set;
- For specific oeprations on the data set, please see the run_analysis.R script and README.md document.




