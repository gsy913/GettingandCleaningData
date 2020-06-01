# GettingandCleaningData

## Load library
Load library "dplyr" in order to use functions from the package "dplyr".

## Load raw data, edit column names and merge data sets
- I used read.table() to read in the .txt files from the working directory;
- For subject and activity label information, I used col.names argument to set column names in the corresponding data frames;
- For feature information, since there are 561 feature names, I first loaded the name list from feature.txt using read.table() and save it into a data frame called feature_names, note that the second column of this data frame is the actual name info; 
- After examining the names, I found there are some names are not accepted by R naming rules; to correct them , I used make.names() function to make the feature names both unique (unique=TRUE argument) and compatible with R (allow_=TRUE argument), and save the new names into a new list called valid_feature_names;
- I then assigned valid_feature_names to the column names of both feature dataset feature_test and feature_train, using names();
- I combined subject, activity label and feature data frames for either test or train dataset together using cbind() function and saved it into a new data frame called either test_data or train data;
- I again combined test_data and train_data using rbind() into a merged dataset called data, to discern the source of data (either form train or test set), I created a factor list called data_id which contains two levels: test and train, and the number of these two levels corresonding to their observation number;
- I added this data_id list to the merged dataset by cbind() again.The "data" data frame is the final product of step1.

## Extract the mean and standard deviation of each measurement
- To extract the columns for all means and standard deviations of each feature measurement, I used grep() function to find all the columns that contains the pattern "mean." or "std.", this will return the column numbers for all the satisfied columns;
- I then insert the grep() funciton into the select() function, along with the other columns I wanted to include in the new data set, namely subject id (col 1), activity label (col 2),and data_id(col 564, which is the last col);
- I selected the aforementioned columns from "data" and save it into a new data frame called data1. This is the final product of step2.

## Use descriptive acticitiy names to replace numbers of activity label
- I used gsub() function to replace all activity labels into their corresponding activity names, according to the information given by the raw data sets.

## Create the second data set with the average of each variable for each activity and each subject
- I first set the subject_id and activity_label column into a factor list using as.factor() function, so that I could use group_by function to split the data1 data frame by subject and activity;
- I then split the data1 by subject and activity using group_by() function and saved it into a new data frame called factor_data, so that I could use summarise() funciton;
- To include all feature mean/std measurements (66 in total), I first extracted the column names for these measurements and saved into a vlist called vars;
- I used a variation of the summarise() function called summarise_at(), which affects variables selected with a character vector (in this case my vars list mentioned above), and this function then caculated the average (since I specified the function to be "mean") of each satisfied column according to each subject and each activity, from the factor_data;
- The above result is saved into a final data frame called data2, which is the product of step5.
- I then write out both data1 and data2 into .txt file. *The grader can look at the final tidy data set data2 using read.table("step5_dataset.txt") function under the working directory.*
