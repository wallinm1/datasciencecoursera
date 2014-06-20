rm(list=ls(all=TRUE)) 
gc()

setwd("~/CourseraDataScience/GettingAndCleaningData/CourseProject")

#comment the following rows if you have already downloaded the files
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="data.zip")
unzip("data.zip")
#remove zipped file
file.remove("data.zip")

#read all the necessary files
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
#manual gc after reading the bigger files
gc()
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
gc()
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
#read strings as chars, not factors. Factors can cause confusion when merging data,
#characters are a bit more "immutable"
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)
features <- read.table("UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)

#make feature names into syntactically valid ones
valid_feats <- make.names(features$V2)

#set the valid names
names(X_train) <- valid_feats
names(X_test) <- valid_feats

#put subject labels and y-labels into X_train and X_test frames
X_train$y <- y_train$V1
X_test$y <- y_test$V1
X_train$subject <- subject_train$V1
X_test$subject <- subject_test$V1

names(activity_labels) <- c("y", "activity")
#merge numeric y-labels with corresponding string labels
X_train <- merge(X_train, activity_labels)
X_test <- merge(X_test, activity_labels)

#Do the final merging of the train and test sets
df <- rbind(X_train, X_test)
#remove the integer labels y
df <- df[,-which(names(df) %in% c("y"))]

#Remove the redundant dataframes
#We leave some of the less wide objects in memory as they don't need much space
rm(X_train)
rm(X_test)
gc()

#take row names with mean or std in the name
keep <- grep("(mean)|(std)",names(df),value=TRUE)
#remove names with freq... we want to get rid of meanFreq-columns
rem <- grep(("freq"),keep,ignore.case=TRUE)
keep <- keep[-rem]
#we also want to keep the subject and activity columns
keep <- c(keep, "subject", "activity")

#subset df accordingly
df <- df[,keep]

#aggregate and write to disk
agg <- aggregate(. ~ subject + activity, data = df, FUN = mean)
agg <- agg[with(agg, order(subject, activity)),]
write.table(agg, "tidyData.txt", row.names=FALSE)

#alternate way to aggregate data with melt and dcast
#library(reshape2)
#group <- c("subject","activity")
#vars <- names(df)[-which(names(df) %in% group)]
#melt_df <- melt(df, id=group, measure.vars=vars)
#narrow_df <- dcast(melt_df, subject + activity ~ variable, mean)
#  df <- df[,-which(names(df) %in% c("y"))]