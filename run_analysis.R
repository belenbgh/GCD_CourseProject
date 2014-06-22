##################################################################
##
## Geting and Cleaning Data
##
## Course Project: run_analysis.R
##
##################################################################


## Read common information for both test and train data sets:

	activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",
						colClasses = "character",
						col.names = c("activity_id", "activity_desc"))

	features <- read.table("UCI HAR Dataset/features.txt",
					colClasses = "character",
					col.names = c("X_col_number", "feature_desc"))

## Read test data:

	# Each row is the subject who performs the activity
	subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

	# Each row shows the activity the subject performs
	y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

	# Each row shows the features (measurements) for that subject and activity
	X_test <- read.table("UCI HAR Dataset/test/X_test.txt")

	# So, we use subject_test to add a column to X_test to tells us about 
	# the subject and y_test to add a column to X_test to tells us about
	# the activity the subject is performing.

	test_data <- cbind(subject_test, y_test, X_test)
	
	# Finally, we add descriptive colum names to X_test: 
	# subject_id, activity, feature_1, feature_2, ..., feature_561

	names(test_data) <- c("subject_id", "activity_id", features$feature_desc)
	# he tenido que leer el features as character porque si no, lo convertia todo
	# en factor y features$feature_desc me devolvia los niveles o lo que sea en 
	# lugar de los nombres!!!
	

## Read train data: (same steps as for test data)

	# Each row is the subject who performs the activity
	subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

	# Each row shows the activity the subject performs
	y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

	# Each row shows the features (measurements) for that subject and activity
	X_train <- read.table("UCI HAR Dataset/train/X_train.txt")

	# So, we use subject_train to add a column to X_train to tells us about 
	# the subject and y_train to add a column to X_train to tells us about
	# the activity the subject is performing.

	train_data <- cbind(subject_train, y_train, X_train)
		
	# Finally, we add descriptive colum names to X_test: 
	# subject_id, activity_id, feature_1, feature_2, ..., feature_561

	names(train_data) <- c("subject_id", "activity_id", features$feature_desc)


## Put together test and train data: 

	raw_data <- rbind(test_data, train_data)

## At this point, we have a data frame in which each row correspond for all the
## features (1 to 563) for a subject (1 to 30) and for an activity (1 to 6);
## 10299 obs. of 563 variables (561 features + subject_id + activity_id)


## Of all features, we are only interested in those involving mean and std
## of the measurements, so we'll keep just those columns of raw_data:

	# Returns the indexes of the column names where the pattern occurs:
	mean_std_cols <- grep(pattern = "mean\\(\\)|std\\(\\)", names(raw_data))

	# Select those columns from raw_data (in addition to subject and activity
	# columns):
	raw_data_2 <- raw_data[ , c(1, 2, mean_std_cols)]

## We now have a data frame in which each row correspond for the mean and std
## features (1 to 66) for a subject (1 to 30) and for an activity (1 to 6);
## 10299 obs. of 68 variables (66 features + subject_id + activity_id)


## We use activityLabel to transform from number labels to more
## descriptive labels. Once we have put together all the data refering the test
## set, we can afford merging with the activityLabels data frame (it couldn't be
## done before because the order relation betewn the three previos data sets)

	raw_data_2$activity_id <- as.factor(raw_data_2$activity_id)

	levels(raw_data_2$activity_id) <- activity_labels$activity_desc

	# And change the name of the column to better fit its content
	names(raw_data_2)[2] <- "activity_desc"


## Compute the average of each variable for each subject and each activity
## and store it in a new data frame:

	# Assuming 'reshape2' is installed, load the package
	library(reshape2)

	# First, melt the raw_data data frame
	
	raw_data_cols <- names(raw_data_2)
	melted_data <- melt(raw_data_2, 
				  id = c("subject_id", "activity_desc"), 
				  measure.vars = raw_data_cols[3:length(raw_data_cols)])

	# Then, agregate it computing the mean for each variable for each 
	# combination of subject_id and activity_desc
	
	tidy_data <- dcast(melted_data, subject_id + activity_desc ~ variable, mean)

## So far, we've not had to adressed any column by dataframe$col_name, but in 
## order to avoid problems with the column names in future analysis of this data 
## set, let's make them R legal column names:

	#(aunque esto ahora va a quedar mucho mas feo en el codebook, no?!)

	names(tidy_data) <- make.names(names(tidy_data)) 
	# pues si... :(

## Finally, write a text file with the tidy data set; set the option of not 
## writing the line numbers preventing them to appear in future readings of 
## the file:
	
	write.table(tidy_data, 
			file = "mean_std_averages_by_activity_and_subject.txt", 
			row.names = FALSE)


