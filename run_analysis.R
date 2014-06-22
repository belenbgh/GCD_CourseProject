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

# Esto de abajo aun no se si lo quiero hacer aqui...

## We want to remove the characters "-", "(", ")" and "," in order to have
## valid column names, but preserving the original column

#ilegal_chars <- c("-", "[:(:]", "[:):]", ",")

features$feature_desc_2 <- gsub(pattern = "-", replacement = "_", features$feature_desc)
features$feature_desc_2 <- gsub(pattern = "[:(:]", replacement = "_", features$feature_desc_2)
features$feature_desc_2 <- gsub(pattern = "[:):]", replacement = "_", features$feature_desc_2)
features$feature_desc_2 <- gsub(pattern = ",", replacement = "_", features$feature_desc_2)


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
	
	# Finally, we add colum names to X_test: 
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
		
	# Finally, we add colum names to X_test: 
	# subject_id, activity, feature_1, feature_2, ..., feature_561

	names(train_data) <- c("subject_id", "activity_id", features$feature_desc)

## Put together test and train data: (puesto que aqui - si no lo estoy
## entendiendo mal - solo hay que poner un conjunto a continuacion del otro, quiza 
## deberías hacerlo antes de haber estado haciendo paso por duplicado... no?
## me refiero a convertir los activity labels y eso...)

data <- rbind(test_data, train_data)


## Since we are only insterested in those features involving mean and std
## of the measurements, we'll extract those columns of the X_test and X_train
## data sets...

# returns the indexes of the rows where the pattern occurs
mean_columns <- grep(pattern = "mean", features$feature_desc)
std_columns <- grep(pattern = "std", features$feature_desc)
# Combine the former two to obtain one vector with the row indexes we are 
# interested in (which will turn to be column indexes to X data)
mean_std_columns <- sort(c(mean_columns, std_columns))

# ...ooooooooooooo!!!

mean_std_cols <- grep(pattern = "mean|std", names(data))
# ojo! con esto se me estan colando las meanFreq, va??

## Y nos quedamos solo con aquellas columnas cuyos indices nos ha dado la operacion
## anterior, mas las columnas subject and activity
data_2 <- data[, c(1,2,mean_std_cols)]


# We use activityLabel to transform to number labels to more
	# descriptive labels. Once we have put together all the data refering the test
	# set, we can afford merging with the activityLabels data frame (it couldn't be
	# done before because the order relation betewn the three previos data sets)

	data <- merge(data, 
			 activity_labels, 
			 by.x = "activity_id",
			 by.y = "activity_id",
			 all = TRUE)
	# se me esta quejando de algunas columnas y no se si es por los caracteres 
	# ilegales en los nombres de las mismas... Nada, creo q se queja porque los
	# nombres de las columnas son demasiado largos. 
	# La cosa es ques esto reordena las columnas (además de las filas) asi que
	# deberíamos juntar los sets test y train antes de hacer el merge con los
	# activity_labels. Pero... tiene que haber una forma de hacerlo en plan
	# operaciones vectorizas!! no??
	# Bueno, en cualquier caso, lo hagas como lo hagas, no tiene sentido hacerlo
	# dos veces, asi que lo llevo para abajo, ok??




## Compute the average of each variable for each subject and each activity
## and store it in a new data frame:
## [quizá es interesante en este punto, crearme una clave unica que junte 
## individuo y actividad, aunq en realidad no se qué me aporta esto o si 
## merece la pena...]
 






## what form should the text file be in?
## Of appropriate formats for this assignment and all the formats that Coursera 
## will accept, a good intersection of the two is a txt file made with 
## write.table. I sincerely hope by the end of week 3 anyone marking your work 
## (and thus who has done the assignment) is capable of dealing with a text 
## file. Particularly if you make it easy for your markers by explaining how to 
## read it into R (for instance using read.table). Protip, if using write.table,
## set the option of not writing the line numbers as that can look a bit ugly 
## when reading it back in.

write.table(dataframe, 
		file = "mean_std_averages_by_activity_and_subject.txt", 
		row.names = FALSE)

