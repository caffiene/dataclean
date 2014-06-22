Codebook for tidyData.txt

Author: caffeine

Last update:  20 June 2014

Purpose:  Describe the tidy data set produced by the run_analysis.R script using the  Human Activity Recognition Using Smartphones Dataset (version 1.0).  More information on the run_analysis.R script may be found in the accompanying README.md file.  For more information on the original data set see

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

for a full description of the original data.  The zipped data file is available at: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data Structure:

The tidy data set consists of 180 observations of subject, activity and derived feature data.   The number of observations reflects all possible permutations of thirty subjects and six different activities.  Each observation consists of a subject identifier, an activity label, and the average of select feature variables for that subject and activity.  In this case, there are 79 feature variables chosen from the original 561element feature vector that either describes the mean or standard deviation of raw measurements.  The resulting data frame is thus 180 by 81.

run_analysis.R also provides the file bigData.txt from includes the original values for the 79 mean and std variables mentioned above.  The data frame in this case is 10299 by 81.

The data set is tidy since:
- Each variable forms a column
- Each observation forms a row
- The table stores data about one kind of observation (HAR)

Variables:

1.  Subject : identifier of participant
    Values: 1-30

2.  Activities: activity performed by the participant when the data was captured
    Values: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

3-81: variables reflecting the average of select feature variables that describe the mean or standard deviation of raw measurements
    Values: real value between [-1,1]

Legend for variable names

t,f – time and frequency domain variables, respectively
x,y,z - used to denote 3-axial signals in the X, Y and Z directions
acc – accelerometer
gyro – gyroscope
mag – magnitude
Body, Gravity – signals due to body and gravitational acceleration respectively

3.  tBodyAcc.mean.X               
4.	tBodyAcc.mean.Y              
5.	tBodyAcc.mean.Z               
6.	tBodyAcc.std.X               
7.	tBodyAcc.std.Y                
8.	tBodyAcc.std.Z               
9.	tGravityAcc.mean.X            
10.	tGravityAcc.mean.Y           
11.	tGravityAcc.mean.Z            
12.	tGravityAcc.std.X            
13.	tGravityAcc.std.Y             
14.	tGravityAcc.std.Z            
15.	tBodyAccJerk.mean.X           
16.	tBodyAccJerk.mean.Y          
17.	tBodyAccJerk.mean.Z           
18.	tBodyAccJerk.std.X           
19.	tBodyAccJerk.std.Y            
20.	tBodyAccJerk.std.Z           
21.	tBodyGyro.mean.X              
22.	tBodyGyro.mean.Y             
23.	tBodyGyro.mean.Z              
24.	tBodyGyro.std.X              
25.	tBodyGyro.std.Y               
26.	tBodyGyro.std.Z              
27.	tBodyGyroJerk.mean.X          
28.	tBodyGyroJerk.mean.Y         
29.	tBodyGyroJerk.mean.Z          
30.	tBodyGyroJerk.std.X          
31.	tBodyGyroJerk.std.Y           
32.	tBodyGyroJerk.std.Z          
33.	tBodyAccMag.mean              
34.	tBodyAccMag.std              
35.	tGravityAccMag.mean           
36.	tGravityAccMag.std           
37.	tBodyAccJerkMag.mean          
38.	tBodyAccJerkMag.std          
39.	tBodyGyroMag.mean             
40.	tBodyGyroMag.std             
41.	tBodyGyroJerkMag.mean         
42.	tBodyGyroJerkMag.std         
43.	fBodyAcc.mean.X               
44.	fBodyAcc.mean.Y              
45.	fBodyAcc.mean.Z               
46.	fBodyAcc.std.X               
47.	fBodyAcc.std.Y                
48.	fBodyAcc.std.Z               
49.	fBodyAcc.meanFreq.X           
50.	fBodyAcc.meanFreq.Y          
51.	fBodyAcc.meanFreq.Z           
52.	fBodyAccJerk.mean.X          
53.	fBodyAccJerk.mean.Y           
54.	fBodyAccJerk.mean.Z          
55.	fBodyAccJerk.std.X            
56.	fBodyAccJerk.std.Y           
57.	fBodyAccJerk.std.Z            
58.	fBodyAccJerk.meanFreq.X      
59.	fBodyAccJerk.meanFreq.Y       
60.	fBodyAccJerk.meanFreq.Z      
61.	fBodyGyro.mean.X              
62.	fBodyGyro.mean.Y             
63.	fBodyGyro.mean.Z              
64.	fBodyGyro.std.X              
65.	fBodyGyro.std.Y               
66.	BodyGyro.std.Z              
67.	fBodyGyro.meanFreq.X          
68.	fBodyGyro.meanFreq.Y         
69.	fBodyGyro.meanFreq.Z          
70.	fBodyAccMag.mean             
71.	fBodyAccMag.std               
72.	fBodyAccMag.meanFreq         
73.	fBodyBodyAccJerkMag.mean      
74.	fBodyBodyAccJerkMag.std      
75.	fBodyBodyAccJerkMag.meanFreq  
76.	fBodyBodyGyroMag.mean        
77.	fBodyBodyGyroMag.std          
78.	fBodyBodyGyroMag.meanFreq    
79.	fBodyBodyGyroJerkMag.mean     
80.	fBodyBodyGyroJerkMag.std     
81.	fBodyBodyGyroJerkMag.meanFreq