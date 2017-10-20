
# Intro -------------------------------------------------------------------

# Data Cleaning final project -- Otis Skipper
library(tidyverse)
# Import Data -------------------------------------------------------------

# Get features file
setwd('/Users/oskipper/Documents/Data Science/DSAccelerator/SecondPhase/Coursera/DataCleaning/Final Project/UCI HAR Dataset')
features <- read.table('features.txt')


# Get train Data
setwd('/Users/oskipper/Documents/Data Science/DSAccelerator/SecondPhase/Coursera/DataCleaning/Final Project/UCI HAR Dataset/train')
X_train <- read.table('X_train.txt')
y_train <- read.table('y_train.txt')
subject_train <- read.table('subject_train.txt')


# Get Test Data
setwd('/Users/oskipper/Documents/Data Science/DSAccelerator/SecondPhase/Coursera/DataCleaning/Final Project/UCI HAR Dataset/test')
X_test <- read.table('X_test.txt')
y_test <- read.table('y_test.txt')
subject_test <- read.table('subject_test.txt')



# 1) Merge Data --------------------------------------------------------------
# TODO:: Actually merge the datasets

X_comb <- rbind(X_train, X_test)
y_comb <- rbind(y_train, y_test)
subject_comb <- rbind(subject_train, subject_test)

# Extract Mean & Standard Deviation ---------------------------------------

# Add column names for the tfeaturs
names(X_comb) <- features$V2

# Create a vector that will tell us all columns with mean/std in them
cols_to_take <- grep("mean|std", names(X_comb))

#Grab just hte columns we care about from X_comb
X_mean_std <- X_comb[cols_to_take]


# Descriptively Name Activites --------------------------------------------
# Use the .txt file provided
setwd('/Users/oskipper/Documents/Data Science/DSAccelerator/SecondPhase/Coursera/DataCleaning/Final Project/UCI HAR Dataset')
activities <- read.table('activity_labels.txt')
names(activities) <- c('number', 'activity')


# Create Descriptive Variable Names ---------------------------------------
# By adding all the variable names from before they're about as descriptive & concise as you can get
# Get rid of '-' and '()' characters for cleanliness

names(X_mean_std) <- gsub("-","", names(X_mean_std))
names(X_mean_std) <- gsub("\\(\\)","", names(X_mean_std))
names(X_mean_std)  <- gsub("^t", "", names(X_mean_std))


# Create New Tidy Data Set ------------------------------------------------

# average of each variable for each activity and each subject.
# Each subject/activity combo is an observation
# Each different x/y/z smartphone measurment is a variable

# Add subject/activity to dataset
X_mean_std['activitynumber'] <- y_comb #Make sure that X_comb & y_comb are rbinded in the same order
X_w_activities <- left_join(X_mean_std, activities, by = c('activitynumber' = 'number'))
X_w_activities['subject'] <- subject_comb
xfinal <- X_w_activities



xoutput <- xfinal %>% 
  group_by(subject, activity) %>% 
  summarise_all(funs(mean))


# Export Tidy Data --------------------------------------------------------
setwd('/Users/oskipper/Documents/Data Science/DSAccelerator/SecondPhase/Coursera/DataCleaning/Final Project/ToTurnIn/')
write.table(xoutput, file = 'final_tidy_data.csv', row.names =FALSE)

