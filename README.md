==================================================================
Data Cleaning Coursera Final Project
Version 1.0
==================================================================
Otis Skipper
==================================================================

Project that covers the process of Importing data from a raw data set, Merging/Cleaning it & Exporting it as a tidy data set for the Data Cleaning Coursera assignment. The data comes from various subjects (people) performing different physical activities. Measurments are different features describing physical measurments about their movment (jerk, acceleration etc...)

Source of Raw Data:
A full description of the raw data is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the raw data used for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


For each record it is provided:
======================================


The dataset includes the following files:
=========================================

- 'README.txt'

- 'CodeBook.md': Describes variables in raw data & exported tidy data, transformations used to clean data.

- 'run_analysis.R': Code that imports data, cleans it and then exports a final tidy data set. Main submission for class.

- 'final_tidy_data.csv': A CSV file of the final tidy data. Each row is an observation of a certain subject doing a certain activity, with the columns being values of various features describing their movement.


Notes: 
======
- Features are normalized and bounded within [-1,1].


License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Otis Skipper. October 2012.
