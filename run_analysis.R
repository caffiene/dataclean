## run_analysis.r
## 
## run_analysis() reads the UCI HAR dataset, cleans the data and
## and creates two data sets.  For more details, see README.md.
##
## Assumptions
##
## 1.  The UCI HAR Datset folder is in the current working folder.
## 2.  2.  The library “plyr” has been installed.
##
## Inputs
##
## No inputs are provided by the user but the script will read
## the following files.
##
## UCI HAR Dataset/features.txt
## UCI HAR Dataset/activity_labels.txt
## UCI HAR Dataset/train/X_train.txt
## UCI HAR Dataset/train/y_train.txt
## UCI HAR Dataset/train/subject_train.txt
## UCI HAR Dataset/test/X_test.txt
## UCI HAR Dataset/test/y_test.txt
##
## Outputs
##
## Two text files are generated in the current working folder:
## 
## bigdata.txt - Contains the merged training and test files.
##   Only features pertaining to mean or standard deviation of
##   measurements are retained.  All columns are labelled and
##   activities are denoted with descriptive labels.  Each row
##   contains an observation consisting of the subject
##   identifier, activity label and selected features.
## tidydata.txt - A second independent data set with the average
##   of each selected feature for each subject and activity.
##   For more details concerning the tidy data set, see
##   Codebook.md.

run_analysis = function(){
  
  # 'plyr' is needed to create the tidy data set
  library(plyr)
  
  # get the feature vector and activity labels
  features <- read.table("UCI HAR Dataset/features.txt", 
                         comment.char = "")
  activities <- read.table("UCI HAR Dataset/activity_labels.txt", 
                           comment.char = "")
  
  # strip the first column (just row numbers)
  features <- features[,2]
  activities <- activities[,2]
  
  # now clean the feature vector labels by removing "()"
  # and replacing "-" with "."
  features <- gsub("\\(\\)","",features)
  features <- gsub("-",".",features)
  
  # Get the column numbers corresponding to mean and std
  meanstdFeatures <- grep("mean|std",features)
  
  # get the training set (x = feature, y = activities,
  # subject = participants)
  trainXvalues <- read.table("UCI HAR Dataset/train/X_train.txt",
                               comment.char = "", 
                               colClasses="numeric")
  trainYvalues <- read.table("UCI HAR Dataset/train/Y_train.txt",
                               comment.char = "", 
                               colClasses="numeric")
  trainSubjectvalues <- read.table("UCI HAR Dataset/train/subject_train.txt",
                                    comment.char = "", 
                                    colClasses="numeric")
  
  # get the test data (x = feature, y = activities,
  # subject = participants)
  testXvalues <- read.table("UCI HAR Dataset/test/X_test.txt", 
                              comment.char = "", 
                              colClasses="numeric")
  testYvalues <- read.table("UCI HAR Dataset/test/Y_test.txt", 
                              comment.char = "", 
                              colClasses="numeric")
  testSubjectvalues <- read.table("UCI HAR Dataset/test/subject_test.txt",
                                    comment.char = "", 
                                    colClasses="numeric")
  
  # concatenate, label and filter the X data frames
  Xvalues <- rbind(trainXvalues,testXvalues)
  names(Xvalues) <- features  # label the features vector
  Xvalues <- Xvalues[,meanstdFeatures]  # select mean, std columns
  
  # now apply activity labels to the Y data frames, concatenate
  trainYvalues[,1] <- activities[trainYvalues[,1]]
  testYvalues[,1] <- activities[testYvalues[,1]]
  Yvalues <- rbind(trainYvalues,testYvalues)
  names(Yvalues) <- "Activities"
  
  # concatentate and label the subject data frames
  SubjectValues <- rbind(trainSubjectvalues,testSubjectvalues)
  names(SubjectValues) <- "Subject"
  
  # build the data set
  dataSet <- cbind(SubjectValues,Yvalues,Xvalues)
  
  # sort by activity and then subject
  dataSet <- dataSet[order(dataSet$Subject,dataSet$Activities),]
  
  # now create the tidy dataset
  tidyData <- ddply(dataSet,.(Subject,Activities), numcolwise(mean))
  
  # write out both data sets
  write.table(dataSet,file="./bigdata.txt",row.names=FALSE)
  write.table(tidyData,file="./tidydata.txt",row.names=FALSE)
}