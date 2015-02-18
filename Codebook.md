
# *** Description of the original raw data ***
The data is obtained from the UCI Machine Learning Repository. The dataset used is the Human Activity Recognition  using Smartphones dataset.
The data set has been a result of the observations of 30 volunteer subjects performing six activities of daily living - WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LYING - while carrying a waist mounted smartphone with sensors to record different measurements.
# **** Assumption ****
It is assumed that the datastes in the zipped folder are available in the GettingAndCleaningData/data/Courseproject folder  
 
# *** Data Transformation ***
 
*Step 1 & 2 : Merge data and Extract the mean and std deviation variables
Download the datafiles and read the data in from the individual files into datasets. Assign appropriate column names to the measurement dataset from the features.txt file. Assign appropriate column names, like subjectId, activityId and activityType to the relevant columns.

We can combine all the raw data in the train & test datasets into one dataset and I have the section for that in run_analysis.R file from Lines 35-39 (commented out). However for the purpose of this project, since we only need the mean and standard deviation for each measurement, ie. variables with labels having mean() & std() in them, I have subsetted this out using grep(), before combining the datasets.

Combine the data for the subjects(subject file) , activities (y file) and measurements(x file) using cbind. Repeat the same process for train data.

Combine the test and train data using rbind to get the complete dataset, completereqddata.

*Step 3: Use Descriptive Activity Names 
Add a column to the "completereqddata" dataset with the detailed description of the activities, by looking up the corresponding activity id in the activity_labels.txt file (the merge function is used for this).
 
*Step 4: Descriptive variable names for the dataset 
Modify the labels of the variables in the resulting dataset to come up with more meaningful, descriptive names.I have done this by removing the () from the variable names

*Step 5: Create a tidy data set with averages
A new dataset 'tidyaverages' is created from the previous dataset that contains all the averages of all variables for each subject and activity. ddply from the plyr package is used to split the dataset by activity and subject and then apply the mean function across all numeric columns.
The tidyaverages data set contains 180 observations with 68 variables


