**README.md for the Getting and Cleaning Data course project**

####Project Description 
The purpose of this project is to be able to collect, work with and produce a tidy data set, that can be used for analysis. The raw data provided represents the measurements collected from the accelerometers in the Samsung Galaxy S smartphone. Produce an R script that manipulates the raw data in the following manner :

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Add a Codebook.md and README.md file for the project and add it to the Github repository. Upload the resultant tidy data set as a txt file into the repo.

#### The source of the data :
*https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip* 

#### Reference : UCI Machine Learning Repository
*http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones*

The script in run_analysis.R starts with the assumption that the Samsung data is available in the working directory in an unzipped folder data/CourseProject

####Repository contents

* README.md - current file
* Codebook.md - information about the raw and tidy  data set and description of methods or steps used to transform the raw data into the tidy data set.
* run_analysis.R - the R script file that converts the raw data into a tidy data set.
* averages.txt - the result dataset uploaded as a text file

###  Data Transformation 
 
##### 1 & 2. *Merge data and Extract the mean and std deviation variables*
Download the datafiles and read the data in from the individual files into datasets. 
Assign appropriate column names to the measurement dataset from the features.txt file. 
Assign appropriate column names to the subjects (subjectid) and y datasets (activityid and activitytype).

We could combine all the raw data in the train & test datasets into one dataset and I have the section for that in run_analysis.R file from Lines 35-39 (commented out). However for the purpose of this project, since we only need the mean and standard deviation for each measurement, ie. variables with labels having mean() & std() in them, I have subsetted this out using grep(), before combining the datasets. This way we only get the relevant data, instead of all the variables.

Combine the test data for the subjects(subject file) , activities (y file) and measurements(x file) using cbind. Repeat the same process for train data. This results in 2 datasets (for test and train) that have the subject , the activity performed by the subject and the associated measurements for that activity.

Combine the test and train data using rbind to get the complete dataset, completereqddata.

##### 3. *Use Descriptive Activity Names*
Create a new dataset, by adding a column to the dataset from the previous step with the detailed description of the activities (instead of the activityid), by looking up the corresponding activity id in the activity_labels.txt file (the merge function is used for this).
 
##### 4. *Descriptive variable names for the dataset* 
Modify the labels of the variables in the resulting dataset to come up with more meaningful, descriptive names.
I have done the following to clean up the variable names and make it more meaningful :
 
 * removing the () from the variable names  ( mean instead of mean() and std instead of std() )
 * change all variable names to lowercase
 * replacing the t and f in variable names beginning with t and f, with time and frequency 

This dataset is the resultant dataset with the complete data from the test and train datasets, as per requirements. 

The datawithactivity dataset lists all the mean and std deviation observations for the 30 subjects for all 6 activities.

##### 5. *Create a tidy data set with averages*
A new dataset is created from the previous dataset that contains the averages of all variables for each subject and activity. ddply from the plyr package is used to split the dataset by activity and subject and then apply the mean function across all numeric columns for each subset.

The resultant tidyaverages data set contains 180 observations with 68 variables

The tidyaverages dataset is written into a text file using the write.table function.

