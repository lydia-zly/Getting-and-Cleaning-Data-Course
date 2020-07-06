library("dplyr")

#download files
folder <- "Assignment.zip"
if (!file.exists(folder)){
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(url, folder, method="curl")
} 
unzip("Assignment.zip")

#read files.
subjecttest <- read.table("test/subject_test.txt")
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")


#1.Merges the training and the test sets to create one data set.
test <- cbind(subjecttest,ytest,xtest)
train <- cbind(subjecttrain, ytrain, xtrain)
onedataset <- rbind(test, train)

#2.Extracts only the measurements on the mean and standard deviation for each measurement.
var <- read.table("UCI HAR Dataset/features.txt")
names(onedataset) <- c("subjects", "activities", var[,2])
extractmeasure <- onedataset[,c(1:2, grep("mean()",fixed =TRUE, names(onedataset)),grep("std()", fixed = TRUE, names(onedataset)))]

#3.Uses descriptive activity names to name the activities in the data set
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
extractmeasure[,2] <- as.factor(extractmeasure[,2])
levels(extractmeasure[,2]) <- activity[,2]

#4.Appropriately labels the data set with descriptive variable names
names(extractmeasure) <- tolower(names(extractmeasure))
names(extractmeasure) <- gsub("-","", names(extractmeasure)) 
names(extractmeasure) <- gsub("\\()","", names(extractmeasure))
names(extractmeasure) <- gsub("^t","time", names(extractmeasure))
names(extractmeasure) <- gsub("^f","frequency", names(extractmeasure))

#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
groupdata <- extractmeasure %>% group_by(subjects, activities) 
output <- groupdata %>% summarise_all(funs(mean))
write.table(output, file="output.txt", row.names = FALSE)


