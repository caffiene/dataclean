run_analysis.R Readme

Author: caffeine

Last update:  20 June 2014

Background:  Wearable computing offers exciting opportunities to create new algorithms and applications that utilizes data collected from internal sensors in mobile devices.  One example is identifying human activity from smartphone data.  The Human Activity Recognition Using Smartphones Dataset (version 1.0) captures 3-axial linear acceleration and 3-axial angular velocity at 50 samples per second from 30 volunteers wearing a Samsung Galaxy S II smartphone while engaged in six different activities.

A full description of the data is available at: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The zipped data file is available at: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Each observation (for the purposes of this script) consists of a:

Subject identifier
Activity label
561-feature vector with time and frequency domain variables

A more in-depth description is available in the “README.txt” file in the archive.

Purpose:  The run_analysis.R script reads selected data from the UCI HAR dataset and generates two cleaned data sets.  The following files are read by the script:

UCI HAR Dataset/features.txt: List of all features 

UCI HAR Dataset/activity_labels.txt: Links the training labels with their activity name.

UCI HAR Dataset/train/X_train.txt: Training set of feature vectors

UCI HAR Dataset/train/y_train.txt: Training activity labels for each observation

UCI HAR Dataset/train/subject_train.txt: Training subject identifiers for each observation

UCI HAR Dataset/test/X_test.txt: Test set of feature vectors

UCI HAR Dataset/test/y_test.txt: Test activity labels for each observation
UCI HAR Dataset/test/subject_test.txt: Test subject identifiers for each observation

The script will perform the following:

1.  Merge the training and the test sets to create one data set. 
2.  Extract the features involving the mean and standard deviation.  Features are chosen that have either the term “mean” or “std” in the feature names.
3.  Label the activities in the data with descriptive names.
4.  Label the features retained in the data set with descriptive variable names.  The feature names are retained from “features.txt” but characters that may cause problems in R are replaced – “()-“.
5.  Write the merged data set to the file “bigdata.txt”.
6.  Create a second, independent tidy data set with the average of each variable for each activity and each subject.
7.  Write the tidy data set to the file “tidydata.txt”.

For more information on the contents of “tidydata.txt” see “Codebook.md”.

Assumptions:

1.  The UCI HAR Datset folder is in the current working folder.
2.  The library “plyr” has been installed.
