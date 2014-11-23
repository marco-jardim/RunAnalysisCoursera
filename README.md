#Getting and Cleaning Data Course Project

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
