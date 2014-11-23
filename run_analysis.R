## This script requires library `data.table` to work. 
library(data.table)



################################################################################
### 0) Download and unzip required files for this assignment.
##
#

## Check if `data` directory exists; if not, it is created.
if(!file.exists("./data")){
        dir.create("./data")}

## Check if the file has already been downloaded; if not, then download.
fileURL <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("data//getdata-projectfiles-UCI HAR Dataset")){
        download.file(fileURL, destfile = "./data/getdata-projectfiles-UCI HAR Dataset",
                      method = "curl")}
rm(fileURL)

## Check if the file has already been unzipped; if not, then unzip. For that, it
##   checks the created folder `UCI HAR Dataset` plus its 4 files and 2
##   subfolders.
if(!file.exists("data/UCI HAR Dataset/") |         # Original Folder
   !file.exists("data/UCI HAR Dataset/test/") |    # Containing Folder
   !file.exists("data/UCI HAR Dataset/train/")){   # Containing Folder
        unzip("data/getdata-projectfiles-UCI HAR Dataset", exdir = "./data/")}





################################################################################
### 1. Merge the training and the test sets to create one data set.
##
#

## Import and bind X's from test and train
X_test<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
X_train<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
X<-rbind(X_test,X_train)

## Import and bind subjects from test and train
subject_test<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")
subject_train<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
subject<-rbind(subject_test,subject_train)

## Import and bind Y's from test and train
y_test<-read.table("./data/UCI HAR Dataset/test/y_test.txt")
y_train<-read.table("./data/UCI HAR Dataset/train/y_train.txt")
y<-rbind(y_test,y_train)

## OBSERVATION: in order to make it easier to manipulate all data, the final
##              unique data set is not created (merged from all data) at this
##              step. Therefore, the final data set is created after Step 4 is
##              totally completed.



################################################################################
### 2. Extract only the measurements on the mean and standard deviation for each
##     measurement.
#

## Create a list for the measurements on the mean (mean) and standard deviation
##   (std) for each measurement
features_all <- read.table("./data/UCI HAR Dataset/features.txt")
features <- grep(pattern = "-mean\\(\\)|-std\\(\\)", x = features_all[,2])

## Subset of X for matching features (mean and std), renaming the columns
X <- X[, features]
names(X) <- features_all[features, 2]          # Replace column names
names(X) <- gsub("\\(|\\)","",names(X_feat))   # Clean column names
names(X) <- tolower(names(X_feat))             # All-lower-case names





################################################################################
### 3. Use descriptive activity names to name the activities in the data set.
##
#

## Read original labels
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

## Clean labels names
activity_labels[, 2]=gsub("_","",tolower(as.character(activity_labels[, 2])))

## Replace activities numbers for propper descriptive labels, change header
y[, 1]<-activity_labels[y[, 1], 2]
names(y)<-"activity"





################################################################################
### 4. Appropriately labels the data set with descriptive variable names.
##
#

names(subject) <- "subject"

## Final data is merged
tidydata <- cbind(subject,y,X)
write.table(tidydata, "./big_tidydata.txt")



################################################################################
### 5. From the data set in step 4, creates a second, independent tidy data set
##     with the average of each variable for each activity and each subject.
#

## Creates the necessary variables to run on the following FOR loop
subject_unique  <- unique(subject[, 1])
subject_length  <- length(unique(subject[, 1]))
activity_length <- length(unique(activity_labels[, 1]))
columnn_length  <- length(tidydata[1, ])
final           <- tidydata[1:(subject_length*activity_length), ]


nrow <- 1
for (s in 1:subject_length) {
        for (a in 1:activity_length) {
                final[nrow,1] <- subject_unique[s]
                final[nrow,2] <- activity_labels[a,2]
                tmp <- tidydata[tidydata$subject == s &
                                     tidydata$activity == activity_labels[a,2],]
                final[nrow, 3:columnn_length] <- colMeans(tmp[,3:columnn_length])
                nrow <- nrow + 1
        }
}

write.table(final,"./final_tidydata.txt",row.names=FALSE)