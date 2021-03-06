##Jordan DeHerrera 09 27 2015
##1. Merge the training and test sets to create one data set

#tells r where the train and test dataset files are located

subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
subject <- rbind(subject_train, subject_test)

X_train <- read.table("train/X_train.txt")
X_test <- read.table("test/X_test.txt")
X <- rbind(X_train, X_test)

y_train <- read.table("train/y_train.txt")
y_test <- read.table("test/y_test.txt")
y <- rbind(y_train, y_test)

body_acc_x_train <- read.table("train/Inertial Signals/body_acc_x_train.txt")
body_acc_x_test <- read.table("test/Inertial Signals/body_acc_x_test.txt")
body_acc_x <- rbind(body_acc_x_train, body_acc_x_test)

body_acc_y_train <- read.table("train/Inertial Signals/body_acc_y_train.txt")
body_acc_y_test <- read.table("test/Inertial Signals/body_acc_y_test.txt")
body_acc_y <- rbind(body_acc_y_train, body_acc_y_test)

body_acc_z_train <- read.table("train/Inertial Signals/body_acc_z_train.txt")
body_acc_z_test <- read.table("test/Inertial Signals/body_acc_z_test.txt")
body_acc_z <- rbind(body_acc_z_train, body_acc_z_test)

body_gyro_x_train <- read.table("train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_x_test <- read.table("test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_x <- rbind(body_gyro_x_train, body_gyro_x_test)

body_gyro_y_train <- read.table("train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_y_test <- read.table("test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_y <- rbind(body_gyro_y_train, body_gyro_y_test)

body_gyro_z_train <- read.table("train/Inertial Signals/body_gyro_z_train.txt")
body_gyro_z_test <- read.table("test/Inertial Signals/body_gyro_z_test.txt")
body_gyro_z <- rbind(body_gyro_z_train, body_gyro_z_test)

total_acc_x_train <- read.table("train/Inertial Signals/total_acc_x_train.txt")
total_acc_x_test <- read.table("test/Inertial Signals/total_acc_x_test.txt")
total_acc_x <- rbind(total_acc_x_train, total_acc_x_test)

total_acc_y_train <- read.table("train/Inertial Signals/total_acc_y_train.txt")
total_acc_y_test <- read.table("test/Inertial Signals/total_acc_y_test.txt")
total_acc_y <- rbind(total_acc_y_train, total_acc_y_test)

total_acc_z_train <- read.table("train/Inertial Signals/total_acc_z_train.txt")
total_acc_z_test <- read.table("test/Inertial Signals/total_acc_z_test.txt")
total_acc_z <- rbind(total_acc_z_train, total_acc_z_test)

#combine the data into one dataframe
dataset <- cbind(subject, y, X, body_acc_x, body_acc_y, body_acc_z, 
                 body_gyro_x, body_gyro_y, body_gyro_z, 
                 total_acc_x, total_acc_y, total_acc_z)

#read in the feature list to be used as header for the combined dataframe
features <- read.table("features.txt")
features[,3] <- paste(features[,1],features[,2]) #merge number and label column
features_header <- c(features[1:561,3]) #change labels from a column into a set of char values

#creating names for the dataframe header 
#(this section is not required in the question, since these columns will be removed in q2, but its gd practice)
data_body_acc_x <- data.frame(matrix(nrow=128, ncol=2))
data_body_acc_x[,1] <- "body_acc_x"
data_body_acc_x[,2] <- 1:128
data_body_acc_x[,3] <- paste(data_body_acc_x[,1],data_body_acc_x[,2])
body_acc_x_header <- c(data_body_acc_x[1:128,3])

data_body_acc_y <- data.frame(matrix(nrow=128, ncol=2))
data_body_acc_y[,1] <- "body_acc_y"
data_body_acc_y[,2] <- 1:128
data_body_acc_y[,3] <- paste(data_body_acc_y[,1],data_body_acc_y[,2])
body_acc_y_header <- c(data_body_acc_y[1:128,3])

data_body_acc_z <- data.frame(matrix(nrow=128, ncol=2))
data_body_acc_z[,1] <- "body_acc_z"
data_body_acc_z[,2] <- 1:128
data_body_acc_z[,3] <- paste(data_body_acc_z[,1],data_body_acc_z[,2])
body_acc_z_header <- c(data_body_acc_z[1:128,3])

data_body_gyro_x <- data.frame(matrix(nrow=128, ncol=2))
data_body_gyro_x[,1] <- "body_gyro_x"
data_body_gyro_x[,2] <- 1:128
data_body_gyro_x[,3] <- paste(data_body_gyro_x[,1],data_body_gyro_x[,2])
body_gyro_x_header <- c(data_body_gyro_x[1:128,3])

data_body_gyro_y <- data.frame(matrix(nrow=128, ncol=2))
data_body_gyro_y[,1] <- "body_gyro_y"
data_body_gyro_y[,2] <- 1:128
data_body_gyro_y[,3] <- paste(data_body_gyro_y[,1],data_body_gyro_y[,2])
body_gyro_y_header <- c(data_body_gyro_y[1:128,3])

data_body_gyro_z <- data.frame(matrix(nrow=128, ncol=2))
data_body_gyro_z[,1] <- "body_gyro_z"
data_body_gyro_z[,2] <- 1:128
data_body_gyro_z[,3] <- paste(data_body_gyro_z[,1],data_body_gyro_z[,2])
body_gyro_z_header <- c(data_body_gyro_z[1:128,3])

data_total_acc_x <- data.frame(matrix(nrow=128, ncol=2))
data_total_acc_x[,1] <- "total_acc_x"
data_total_acc_x[,2] <- 1:128
data_total_acc_x[,3] <- paste(data_total_acc_x[,1],data_total_acc_x[,2])
total_acc_x_header <- c(data_total_acc_x[1:128,3])

data_total_acc_y <- data.frame(matrix(nrow=128, ncol=2))
data_total_acc_y[,1] <- "total_acc_y"
data_total_acc_y[,2] <- 1:128
data_total_acc_y[,3] <- paste(data_total_acc_y[,1],data_total_acc_y[,2])
total_acc_y_header <- c(data_total_acc_y[1:128,3])

data_total_acc_z <- data.frame(matrix(nrow=128, ncol=2))
data_total_acc_z[,1] <- "total_acc_z"
data_total_acc_z[,2] <- 1:128
data_total_acc_z[,3] <- paste(data_total_acc_z[,1],data_total_acc_z[,2])
total_acc_z_header <- c(data_total_acc_z[1:128,3])

#naming the columns of the combined dataframe, note that features_header is used here 
names(dataset) <- c("subject_id", "activity_label", features_header, 
                    body_acc_x_header, body_acc_y_header, body_acc_z_header, 
                    body_gyro_x_header, body_gyro_y_header, body_gyro_z_header, 
                    total_acc_x_header, total_acc_y_header, total_acc_z_header)

##----------------------------------------------------------------------------------------------------
##2. Extracts only the measurements on the mean and sd for each measurement
##i.e. only retain columns with mean() and std() in the labels 

#use grep function to extract the index position of the mean() and std() in features_header 
#ref: https://stat.ethz.ch/R-manual/R-devel/library/base/html/grep.html
features_mean <- grep("mean()", features_header, value=FALSE, fixed=TRUE)
features_std <- grep("std()", features_header, value=FALSE, fixed=TRUE)
features_mean_std <- c(features_mean, features_std)

#add 2 to each index position saved in features_mean_std to obtain the exact columns in combined dataset
features_mean_std <- features_mean_std + 2

#extract only mean and std from dataset 
dataset_mean_std <- dataset[,c(1,2,features_mean_std)]

##----------------------------------------------------------------------------------------------------
#3. Use descriptive activity names to name the activities in the dataset 

#This creates a new column with the activity labels
for(i in 1:10299) {
  if(dataset[i,2] == 1) {
    dataset[i,1716] <- 'WALKING'
  } else if(dataset[i,2] == 2) {
    dataset[i,1716] <- 'WALKING_UPSTAIRS'
  } else if(dataset[i,2] == 3) {
    dataset[i,1716] <- 'WALKING_DOWNSTAIRS'
  } else if(dataset[i,2] == 4) {
    dataset[i,1716] <- 'SITTING'
  } else if(dataset[i,2] == 5) {
    dataset[i,1716] <- 'STANDING'
  } else if(dataset[i,2] == 6) {
    dataset[i,1716] <- 'LAYING'
  } 
}

#naming the new column 
names(dataset)[1716] <- 'activity_names'

##----------------------------------------------------------------------------------------------------
#4. Appropriately labels the dataset with descriptive variable names 
#done in step 1 

##----------------------------------------------------------------------------------------------------
#5. From the data set in step 4, create a second, independent tidy data set
#with the average of each variable for each activity and each subject

#create a temporary dataframe with a new column stating subject no. and activity no. 
#e.g. subject 1, activity 2 will be '1.2' - this is a unique id necessary to find mean of each variable
dataset_temp <- dataset_mean_std
dataset_temp[,70] <- paste(dataset_mean_std[,1], '.', dataset_mean_std[,2], sep="")
names(dataset_temp)[70] <- 'subject_activity' #naming the column 

#if the package 'plyr' has not been install, uncomment and run the next line 
#install.packages('plyr')
library(plyr)

#find mean of each variable by the id created in column 70
dataset_mean_std_avg <- ddply(dataset_temp[,3:70], .(subject_activity), colwise(mean))

#remove the last column of NAs - produced because activity_names is a column of char
#and mean cannot be calculated for char
dataset_mean_std_avg <- dataset_mean_std_avg[,-68]

#splitting the subject name and id into 2 columns
split_columns <- data.frame(do.call('rbind', strsplit(as.character(dataset_mean_std_avg$subject_activity),'.',fixed=TRUE)))

#labeling the activities in split_columns dataframe first 
for(i in 1:180) {
  if(split_columns[i,2] == 1) {
    split_columns[i,3] <- 'WALKING'
  } else if(split_columns[i,2] == 2) {
    split_columns[i,3] <- 'WALKING_UPSTAIRS'
  } else if(split_columns[i,2] == 3) {
    split_columns[i,3] <- 'WALKING_DOWNSTAIRS'
  } else if(split_columns[i,2] == 4) {
    split_columns[i,3] <- 'SITTING'
  } else if(split_columns[i,2] == 5) {
    split_columns[i,3] <- 'STANDING'
  } else if(split_columns[i,2] == 6) {
    split_columns[i,3] <- 'LAYING'
  } 
}

#naming the columns in split_columns dataframe 
names(split_columns) <- c('subject', 'activity_no', 'activity_name')

#removing the unique_id column in dataset_mean_std_avg 
dataset_mean_std_avg <- dataset_mean_std_avg[,-1]

#putting the split_columns dataframe with the dataset_mean_std_avg 
dataset_mean_std_avg <- cbind(split_columns, dataset_mean_std_avg)


#fin: the dataset_mean_std_avg is the output required
##----------------------------------------------------------------------------------------------------
