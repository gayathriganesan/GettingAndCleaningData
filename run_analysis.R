## ** COURSE PROJECT - Getting and Cleaning Data  ***
# set the directory for the files related to the course project
filedir<-"C:/Coursera/GettingAndCleaningData/data/CourseProject"
# download the files
# read the measurements from the X-train and X-test - these give the detailed measurements

# read test & train data in from x_test.txt & x_train.txt
testmeasures<-read.table(file.path(filedir,"test","X_test.txt"),header=FALSE)  
trainmeasures<-read.table(file.path(filedir,"train","X_train.txt"),header=FALSE)

# read the data in about the volunteers who did the activities from subject_train.txt and subject_test.txt
testsubjects <- read.table(file.path(filedir,"test","subject_test.txt"),header=FALSE) 
trainsubjects <- read.table(file.path(filedir,"train","subject_train.txt"),header=FALSE)

# read the data in regarding the kind of activity associated with the measurements from Y_train.txt and Y_test.txt
testactivity <- read.table(file.path(filedir,"test","y_test.txt"),header=FALSE)
trainactivity <-read.table(file.path(filedir,"train","y_train.txt"),header=FALSE)

# get the description of the various features that are measured in X_test and X_train
featuresdesc<-read.table(file.path(filedir,"features.txt"),header=FALSE)

# get the activity types
activitytype<-read.table(file.path(filedir,"activity_labels.txt"),header=FALSE)

# assign the column names for the relevant tables
colnames(testmeasures)<-featuresdesc[,2]
colnames(trainmeasures)<-featuresdesc[,2]
colnames(testactivity)<-"activityid"
colnames(trainactivity)<-"activityid"
colnames(testsubjects)<-"subjectid"
colnames(trainsubjects)<-"subjectid"
colnames(activitytype)<-c("activityid","activitytype")

# to merge all train & test data into one complete dataset, we can do the below section.
# but for the purpose of this project, we only need to get the colums with mean() & std() in them.
#traindata<- cbind(trainsubjects,trainactivity,trainmeasures)
#testdata<- cbind(testsubjects,testactivity,testmeasures)
# combine test and training data to get one data set
#completedata<-rbind(traindata,testdata)

# get the list of variables with mean() & std() in them from the featuresdesc dataset
# grep finds all occuences of mean() or std()
meanstdnames<-grep("-(mean|std)\\(\\)",featuresdesc[,2]) 

# subset the measurements in X_test & X_train to get only the mean & std dev columns
reqdtestX<-testmeasures[,meanstdnames]
reqdtrainX<-trainmeasures[,meanstdnames]

# combine the data for the subjects,activities and measurements in one dataset for both the test & train data
traindata<-cbind(trainsubjects,trainactivity,reqdtrainX)
testdata<-cbind(testsubjects,testactivity,reqdtestX)

# merge the reqd columns of both test & train data
completereqddata<- rbind(traindata,testdata)
# link the the name of the activity for the activityid
datawithactivity<- merge(completereqddata,activitytype,by='activityid',all.x=TRUE);
datawithactivity<-datawithactivity[,-1] # remove the activityId column
# clean up the column names 
#remove the () from the variable names ; gsub() replaces all occurences of () with ""
colnames(datawithactivity)<-gsub("\\(|\\)","",colnames(datawithactivity))
# replace variables with BodyBody in their names with one Body
colnames(datawithactivity)<-gsub("BodyBody","Body",colnames(datawithactivity)) 
# replace the f in variables beginning with f to freq to denote frequency
colnames(datawithactivity)<-sub("^f","freq",colnames(datawithactivity))  
# replace the first t in variables beginning with t to time to denote time
colnames(datawithactivity)<-sub("^t","time",colnames(datawithactivity)) 
# replace with lower case variables
colnames(datawithactivity)<-tolower(colnames(datawithactivity))  
# *** leave the dots as separators to show the functions and x,y,z axis ***

library(plyr)  # to group data & apply a summary fn to the group
#creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# numcolwise() runs a summary across all numeric columns
tidyaverages<-  ddply(datawithactivity,.(subjectid,activitytype), numcolwise(mean))

## convert the result data set into a txt file to be uploaded
write.table(tidyaverages, "averages.txt", row.name=FALSE)