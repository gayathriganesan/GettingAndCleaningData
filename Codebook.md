**Codebook.md for the Getting and Cleaning Data course project**
### Description of the original raw data 
The data is obtained from the UCI Machine Learning Repository. The dataset used is the Human Activity Recognition  using Smartphones dataset.
The data set has been a result of the observations of 30 volunteer subjects performing six activities of daily living - WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LYING - while carrying a waist mounted smartphone with sensors to record different measurements.

### Assumption 
It is assumed that the files in the zipped folder are unzipped and available in the GettingAndCleaningData/data/Courseproject folder.  

### Understanding the data 
There are 2 folders test and train with identical format of data in them. Each of these folders have the x, y and subject files. For the purpose of this project, the inertial folders can be ignored. The x files contain the actual values of the  measurements recorded for the subjects during the different activities. The subjects file represents the subject who is doing these activities and the y file shows the actual activities (walking, laying, etc...) that are performed by these subjects. The features file specifies the names of the kind of measurements that have been observed. 

*To get a quick peek at the data, it is recommended to use the Notepad++ editor*

###  Step-by-step results of the data transformation 
* testmeasures , testsubjects, testactivity, trainmeasures, trainsubjects, trainactivity - datasets with the test & train data for the actual measurements, subject ids and activity ids, respectively.
* assign appropriate colnames to all datasets
* reqdtestX & reqdtrainX - subset of testmeasures and trainmeasures, with just the mean() and std() variables
* testdata & traindata - combined datasets of the measurements, subjectids and activityids for test & train data
* completereqddata - combined dataset containing test as well as train data
* datawithactivity - merge the completereqddata dataset with activitytype, to get a descriptive activity name
* Clean up the column names for the datawithactivity. The datawithactivity dataset contains 10299 observations and 68 variables. It lists all the mean and std deviation observations for the 30 subjects for all 6 activities.
* tidyaverages - dataset that contains the average of all the variables in the datawithactivity dataset for each subjectid and activity. The tidyaverages dataset contains 180 observations with 68 variables.
*  averages.txt - the textfile into which the tidayaverages dataset is written.

### Variables in the *tidyaverages* dataset :
The tidyaverages dataset has 180 observations and 68 variables
* subjectid - the id of the volunteer whose measurements are being recorded
* activitytype -the type of activity that is being performed (WALKING, LAYING,...)
* Variables 3 thru 68 - the averages of only the mean() and std() deviation variables specified in the features.txt file
