##################################################################
###
### Geting and Cleaning Data
###
### Course Project README.md
###
##################################################################

##### Content description of "run_analisys.R" file

The "run_analisys.R" file generates a tidy data set (namely "mean_std_averages_by_activity_and_subject.txt") that matches the requirements of the Coursera course "Getting and Cleaning Data" course project.

For the script to work, we assume the data has been downloaded and unzipped from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into our current working directory.

By studing the README.txt and other informative files provided with the data set, as well as looking into the test and train files with a text editor, we get some understanding of the data set and the relationship between the several files. Briefly, regarding the info that is going to be used, we have two sets of data (_test data_ and _train data_), each set in its respective folders containg the files
- UCI HAR Dataset/test/subject_test.txt | UCI HAR Dataset/train/subject_train.txt
- UCI HAR Dataset/test/X_test.txt | UCI HAR Dataset/train/X_train.txt
- UCI HAR Dataset/test/y_test.txt | UCI HAR Dataset/train/y_train.txt
and also have common files to either test/train set:
- UCI HAR Dataset/activity_labels.txt
- UCI HAR Dataset/features.txt

###### "run_analisys.R" script works through the following steps:

1. First of all, the script reads the common information for both test and train data sets into a data frame using read.table customized with 
..- colClasses = "character" to prevent the values in the file from becoming factors, since we will like to use them later as vector string
..- column names assignation to deal with them easily

2. Reads the test and train files into the corresponding data frames. In both cases, the script goes like this:
--1. reads subject_test/train.txt (each row is the subject identifier whose observations are in the corresponding row of X)
--2. y_test/train.txt (each row shows the activity the subject was performing in the observations in the corresponding row of X)
--3. X_test/train (each row shows the features (measurements) for a particular subject and a particular activity)
--4. creates a new data_frame test/train_data using subject_test/train to add a column to X_test/train to tell about the subject and using y_test/train to add a column to X_test/train to tell about the activity the subject performed
--5. finally, it sets descriptive names to the columns in test/train_data, using the features data_frame

3. At this point, test/train_data has the same structure and their rows correspond to the same observations for different subjects, so we can put them all together row binding.

4. Of all features, we are only interested in those involving mean and std of the measurements. According to 'UCI HAR Dataset\features_info.txt', the signals recorded were used to
estimate variables of the features; among them, 'mean()' and 'std()' stand for mean and
standard deviation. So the features we are interested in, from the ones listed in 'UCI HAR Dataset\features.txt', are those with 'mean()' and 'std()' as 
part of its names. The script extracts the indexes of the column names matching those patterns and creates a new date frame with only those columns, besides the subject and activity columns.

5. Now, replaces the numbers in the activity column for its corresponding names in the "UCI HAR Dataset/activity_labels.txt"

6. Computes the average of each variable for each subject and each activity and stores it in a new 
data frame (provided 'reshape2' packaged is installed, loads it and uses melt and dcast to achive the goal).
We have obtained a tidy data set since each variable forms a column, each observation (combinations of subject and activity) forms a row
and the all data stored in the data frame come into averages of some features regarding the observations.

7. Finally, saves this tidy data frame into a text file ("mean_std_averages_by_activity_and_subject.txt") using write.table with row.names = FALSE to of not 
avoid line numbers apparition in future readings of the file.


###### Note 1:
Loading the file, use read.table and header = TRUE to apropiately recover column names and classes
`read.table("mean_std_averages_by_activity_and_subject.txt", header = TRUE)`














