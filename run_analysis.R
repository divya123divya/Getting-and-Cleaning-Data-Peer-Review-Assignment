# Source of data for the project:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# This R script does the following:
# 1. Merges the training and the test sets to create one data set.
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", method="curl", destfile="uci.zip")

#unzip("/Users/Divya/uci.zip", exdir="ucidataset")
setwd("/Users/Divya/ucidataset")
var1 <- read.table("./train/X_train.txt", header=FALSE, sep="")
var2 <- read.table("./test/X_test.txt", header=FALSE, sep="")
a <- rbind(var1, var2)

var1 <- read.table("./train/subject_train.txt", header=FALSE, sep="")
var2 <- read.table("./test/subject_test.txt", header=FALSE, sep="")
b<- rbind(var1, var2)

tmp1 <- read.table("./train/y_train.txt", header=FALSE, sep="")
tmp2 <- read.table("./test/y_test.txt", header=FALSE, sep="")
c<- rbind(var1, var2)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")
indices_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
a <- a[, indices_features]
names(a) <- features[indices_features, 2]
names(a) <- gsub("\\(|\\)", "", names(a))
names(a) <- tolower(names(a)) 
names(a)
# 3. Uses descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
c[,1] = activities[c[,1], 2]
names(c) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(b) <- "subject"
my_complete_data <- cbind(b, c, a)
write.table(my_complete_data, "my_complete_data.txt")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

install.packages("reshape2")
require(reshape2)
extracted <- melt(my_complete_data, id = c("activity", "subject"))
reextracted <- dcast(extracted, formula = subject + activity ~ variable, mean)

write.table(reextracted, "Final_TidyData.txt")
dim(reextracted)
