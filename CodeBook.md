## Data
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## R script
“Run_analysis.R" performs 5 steps according the course’s task:

* Preparation step. Downloading and unzipping dataset.

* Step 1. Merging the training and the test sets to create one data set. 
The step contains some following operations:
Reading files for trainings tables, testing tables, feature data, activity labels. Assigning column names. Merging data in one set.
Created variables: 'X_train', 'Y_train', 'subject_train', 'X_test', 'Y_test', 'subject_test', 'features_data', 'activity_labels', 'mrg_train', 'mrg_test', 'setData'.

* Step 2. Extracting only the measurements on the mean and standard deviation for each measurement, which includes: Reading column names. Create vector for defining ID, mean and standard deviation Making necessary set.
Created variables: 'colNames', 'IDmean_and_std', 'setDataIDMeanAndStd'.

* Step 3. Using descriptive activity names to name the activities in the data set.
Created variables: 'setActivityNames'

* Step 4. Appropriately labeling the data set with descriptive variable names.

* Step 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject
Created variables: 'sec_Tidy_Set'.
