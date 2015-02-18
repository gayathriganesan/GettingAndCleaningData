
# *** Description of the original raw data ***
The data is obtained from the UCI Machine Learning Repository. The dataset used is the Human Activity Recognition  using Smartphones dataset.
The data set has been a result of the observations of 30 volunteer subjects performing six activities of daily living - WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LYING - while carrying a waist mounted smartphone with sensors to record different measurements.
# **** Assumption ****
It is assumed that the datasets in the zipped folder are available in the GettingAndCleaningData/data/Courseproject folder  

# *** Understanding the data ***
There are 2 folders test and train with identical format of data in them. Each of these folders have the x, y and subject files. For the purpose of this project, the inertial folders can be ignored. The x files contain the actual values of the  measurements recorded for the subjects during the different activities. The subjects file represents the subject who is doing these activities and the y file shows the actual activities (walking, laying, etc...) that are performed by these subjects. The features file specifies the names of the kind of measurements that have been observed. 

# *** Data Transformation ***
 
*Step 1 & 2 : Merge data and Extract the mean and std deviation variables
Download the datafiles and read the data in from the individual files into datasets. Assign appropriate column names to the measurement dataset from the features.txt file. Assign appropriate column names to the subjects (subjectid) and y datasets 
(activityid and activitytype).

We could combine all the raw data in the train & test datasets into one dataset and I have the section for that in run_analysis.R file from Lines 35-39 (commented out). However for the purpose of this project, since we only need the mean and standard deviation for each measurement, ie. variables with labels having mean() & std() in them, I have subsetted this out using grep(), before combining the datasets. This way we only get the relevant data, instead of all the variables.

Combine the data for the subjects(subject file) , activities (y file) and measurements(x file) using cbind. Repeat the same process for train data. This results in a dataset that has the subject , the activity performed by the subject and the associated measurements for that activity.

Combine the test and train data using rbind to get the complete dataset, completereqddata.

*Step 3: Use Descriptive Activity Names 
Add a column to the "completereqddata" dataset with the detailed description of the activities (instead of the activityid), by looking up the corresponding activity id in the activity_labels.txt file (the merge function is used for this).
 
*Step 4: Descriptive variable names for the dataset 
Modify the labels of the variables in the resulting dataset to come up with more meaningful, descriptive names.
I have done the following to clean up and make it more understandable :
 
 * removing the () from the variable names
 * change all variable names to lowercase
 * replacing the t and f in variable names beginning with t and f, with time and frequency 

*Step 5: Create a tidy data set with averages
A new dataset 'tidyaverages' is created from the previous dataset that contains all the averages of all variables for each subject and activity. ddply from the plyr package is used to split the dataset by activity and subject and then apply the mean function across all numeric columns.
The tidyaverages data set contains 180 observations with 68 variables

The tidyaverages dataset is written into a text file "averages.txt" using the write.table function.

