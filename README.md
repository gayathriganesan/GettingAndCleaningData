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
