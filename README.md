The run_analysis.R description:
========================================================

README
--------------------------------------------------------
Step 0:

The source data for this project is available at following link:
url= https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Step 1: Merges the training and the test sets to create one data set.
a. Download the file from source location using download.file(),  store it on local drive.
b. Unzip the directory and store on local drive. 
c. Read the test and training directory for X_test.txt and X_train.txt using read.table(), with additional parameter like header = FALSE, sep = “”.  
d. Combine both X_test and X_train using  rbind() in a  variables called a. 
e. Repeat steps 1c-1d for other files.

Step 2. Extraction of the measurements on the mean and standard deviation.
a. Read the features.txt as describe.
b. Extract the column names with mean and std using grep() command.
c. Set the column name of the X_test using column names in feature file. 
d. Remove the (), space and from the column names of the data frame 
e. change column names to all lowercase.


Step 3. Uses descriptive activity names to name the activities in the data set
a. Read the activity_labels.txt to include same activity names as described.
b. change the all the activities to lowercase.
c. Change the name of the column with activities.
 
Step 4. Appropriately labels the data set with descriptive activity names.
a. Change the subject names. 
b. Complete the data by combining using cbind() function. 
c. Write the out put in a file using write.table (). Save it on local disc. 

Step 5. Creates another independent tidy data set with the average of each variable for each activity and each subject. 
used melt and cast functions from package reshape2.
a. load the package reshape2 in R.
b. Use melt function with previously saved dataset with id as subject and activity.
c. dcast, using inbuilt function dcast() with formula and mean to get the mean. 
c. Save the output on local disc as described.
