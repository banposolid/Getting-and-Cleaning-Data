
library(plyr)


# 0. Download file and unzip the dataset

filename <- "dataset.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl") # if OS is Windows, plz remove method = "curl"
}  

unzip(filename) 

# 1. Merging the train and the test data sets to create one data set.

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("UCI HAR Dataset/features.txt")

featuresWanted <- grep("-(mean|std)\\(\\)", features[, 2])
x_data <- x_data[, featuresWanted]
names(x_data) <- features[featuresWanted, 2]

# 3. Uses descriptive activity names to name the activities in the data set.

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
y_data[,1] <- activities[y_data[, 1], 2]
names(y_data) <- "activity"

# 4. Appropriately labels the data set with descriptive variable names.

names(subject_data) <- "subject"

allData <- cbind(x_data, y_data, subject_data)
meanData <- ddply(allData, .(subject, activity), function(x) colMeans(x[, 1:66]))

# 5. Frome the data set in step4, creats a second, independent tidy data set with the average of each variable for each activity and each subject.

write.table(meanData, "result.txt", row.name=FALSE)
