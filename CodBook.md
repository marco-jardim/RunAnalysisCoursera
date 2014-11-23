##Getting and Cleaning Data Course Project CodeBook

This Codebook, available as both .md and .pdf files, describes in detail the data source, variables and steps performed to accomplish this project.


####Data source

A full description of the original data source is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The data assigned for this project were made available on Coursera website: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


####Files from *UCI HAR Dataset* used for this project

* `X_test.txt`
* `X_train.txt`
* `y_test.txt`
* `y_train.txt`
* `subject_test.txt`
* `subject_train.txt`
* `features.txt`
* `activity_labels.txt`


####List of activities

* `walking`
* `walkingupstairs`
* `walkingdownstairs`
* `sitting`
* `standing`
* `laying`


####Column names in tidy data set.

* `subject`
* `activity`
* `tbodyacc-mean-x`
* `tbodyacc-mean-y`
* `tbodyacc-mean-z`
* `tbodyacc-std-x`
* `tbodyacc-std-y`
* `tbodyacc-std-z`
* `tgravityacc-mean-x`
* `tgravityacc-mean-y`
* `tgravityacc-mean-z`
* `tgravityacc-std-x`
* `tgravityacc-std-y`
* `tgravityacc-std-z`
* `tbodyaccjerk-mean-x`
* `tbodyaccjerk-mean-y`
* `tbodyaccjerk-mean-z`
* `tbodyaccjerk-std-x`
* `tbodyaccjerk-std-y`
* `tbodyaccjerk-std-z`
* `tbodygyro-mean-x`
* `tbodygyro-mean-y`
* `tbodygyro-mean-z`
* `tbodygyro-std-x`
* `tbodygyro-std-y`
* `tbodygyro-std-z`
* `tbodygyrojerk-mean-x`
* `tbodygyrojerk-mean-y`
* `tbodygyrojerk-mean-z`
* `tbodygyrojerk-std-x`
* `tbodygyrojerk-std-y`
* `tbodygyrojerk-std-z`
* `tbodyaccmag-mean`
* `tbodyaccmag-std`
* `tgravityaccmag-mean`
* `tgravityaccmag-std`
* `tbodyaccjerkmag-mean`
* `tbodyaccjerkmag-std`
* `tbodygyromag-mean`
* `tbodygyromag-std`
* `tbodygyrojerkmag-mean`
* `tbodygyrojerkmag-std`
* `fbodyacc-mean-x`
* `fbodyacc-mean-y`
* `fbodyacc-mean-z`
* `fbodyacc-std-x`
* `fbodyacc-std-y`
* `fbodyacc-std-z`
* `fbodyaccjerk-mean-x`
* `fbodyaccjerk-mean-y`
* `fbodyaccjerk-mean-z`
* `fbodyaccjerk-std-x`
* `fbodyaccjerk-std-y`
* `fbodyaccjerk-std-z`
* `fbodygyro-mean-x`
* `fbodygyro-mean-y`
* `fbodygyro-mean-z`
* `fbodygyro-std-x`
* `fbodygyro-std-y`
* `fbodygyro-std-z`
* `fbodyaccmag-mean`
* `fbodyaccmag-std`
* `fbodybodyaccjerkmag-mean`
* `fbodybodyaccjerkmag-std`
* `fbodybodygyromag-mean`
* `fbodybodygyromag-std`
* `fbodybodygyrojerkmag-mean`
* `fbodybodygyrojerkmag-std`


####File in which data is saved aftre cleaning and accomplishing all steps

The final output of `run_analysis.R` is saved into `final_tidydata.txt` file.


####The R script `run_analysis.R` contained in the repository works as follows:

* Downloads and unzips `UCI HAR Dataset` data in current working directory subfolder `data`. 
* Imports and merges training and test sets using `rbind()` for `X_test`,`X_train`, and `y_test`; `y_train` and `subject_test`, `subject_train`.
* Loads `feautures.txt` in R object, extracts the names from the data and converts them to lower case.
* Loads `activity_labels.txt` and extracts the names from the data, converts to lower case and uses descriptive activity names to name the activities in the data set.
* Binds tidy data together using `cbind()`.
* Write R object `big_tidydata` into `big_tidydata.txt.txt` file, inside the working directory.
* Calculates the number of subjects, which is 30, and length of activities is 6.
* Names subjects and activities using `FOR` loop in `big_tidydata` to calculate the average of each variable for each activity and each subject, creating the `final` R object.
* Writes `final` into `final_tidydata.txt` file, inside the working directory.
