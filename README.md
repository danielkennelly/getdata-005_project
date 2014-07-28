What This Repo Contains
-----------------------

* README.md ---> This file
* CODEBOOK.md ---> Code book for summary.csv explaining variables, including units of measurement
* run_analysis.R ---> R script used to process raw data and create summary.csv
* summary.csv ---> Tidy dataset listing the mean and standard deviation for each measurement for each subject and activity
* variables.txt ---> list of variables included in summary.csv (minus activity and subject variables)

Raw Data
----------------------------

The raw data that run_analysis.R processes can be found at [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

How to Run the Script
---------------------

Download the raw data zipfile and expand the contents into a directory called "Dataset" in your current working directory. Run the script run_analysis.R in your current working directory. The script generates a tidy csv (summary.csv) file in your working directory listing the mean and standard deviations of each measurement, grouped by subject and activity.

Notes on the Raw Data
---------------------
There are two main dataset: a "test" set and a "train" set, contained in directories called "test" and "train", respectively. The files used by the run_analysis.R script are "subject_test.txt"/"subject_train.txt", "X_test.txt"/"X_train.txt", and "y_test.txt"/"y_train.txt". There are 2,947 observations in the test dataset, and 7,352 observations in the train dataset. The subject files have one variable: a numeric indicating the subject id of each observation (30 subjects). The "X" test/train files have 561 variables. The "y" test/train files have one variable: a numeric code indicating which activity is being performed in a given observation.

What the Script Does
--------------------
When run from within a directory containing the "Datasets" directory, the script run_analysis.R binds the activity and subject data to the test and train datasets. It then merges the test and train datasets into a single dataset. After this, it subsets the data, eliminating all variables except subject, activity, and the 85 variables indicating the standard deviation and mean for each measurement of each observation. The resulting dataset is then properly labeled, sorted according to subject, and output to a comma-separated file called "summary.csv", which is created in the current working directory.
