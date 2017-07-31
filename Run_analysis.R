install.packages("plyr")
library(plyr)

# Download and unzip dataset
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")


# Step 1. Merge the training and the test sets to create common data set:

# 1.Reading files
# Reading train tables:
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Reading test tables:
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Reading features:
features_data <- read.table('./data/UCI HAR Dataset/features.txt')

# Reading activity labels:
activity_labels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

# 2. Assigning column names:
colnames(X_train) <- features_data[,2] 
colnames(Y_train) <-"activity_ID"
colnames(subject_train) <- "subject_ID"

colnames(X_test) <- features[,2] 
colnames(Y_test) <- "activity_ID"
colnames(subject_test) <- "subject_ID"

colnames(activity_labels) <- c('activity_ID','activity_Type')

# 3. Merging all data in one set:
mrg_train <- cbind(Y_train, subject_train, X_train)
mrg_test <- cbind(Y_test, subject_test, X_test)
setData <- rbind(mrg_train, mrg_test)

# Step 2. Extract the measurements on the mean and standard deviation for each measurement

# Read column names:
colNames <- colnames(setData)

# Create vector to define ID, mean and standard deviation:
IDmean_and_std <- (grepl("activity_ID" , colNames) | 
                         grepl("subject_ID" , colNames) | 
                         grepl("mean.." , colNames) | 
                         grepl("std.." , colNames) 
)

# Making nessesary subset from setData:
setDataIDMeanAndStd <- setData[ , IDmean_and_std == TRUE]

# Step 3. Using descriptive activity names to name the activities in the data set:
setActivityNames <- merge(setDataIDMeanAndStd, activity_labels,
                              by='activity_ID',
                              all.x=TRUE)

# Step 4. Appropriately labeling the data set with descriptive variable names.
# It was made during previous steps.

# 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject:

# Making second tidy data set 
sec_Tidy_Set <- aggregate(. ~subject_ID + activity_ID, setActivityNames, mean)
sec_Tidy_Set <- sec_Tidy_Set[order(sec_Tidy_Set$subject_ID, sec_Tidy_Set$activity_ID),]

# Writing second tidy data set in txt file
write.table(sec_Tidy_Set, "Second_Tidy_Data.txt", row.name=FALSE)