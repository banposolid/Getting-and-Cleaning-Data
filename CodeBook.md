# Getting and Cleaning Data
## run_anlysis.R variable and data information

filename : downloaded file name

x_train : dataframe with 7352 obs. of 561 variables, which read from table X_train.txt

y_train : dataframe with 7352 obs. of 1 variable, which read table from y_train.txt

subject_train : dataframe with 7352 obs. of 1 variable, which read table subject_train.txt

x_test : dataframe with 2947 obs. of 561 variables, which read table X_test.txt

y_test : dataframe with 2947 obs. of 1 variable, which read table y_test.txt

subject_test : dataframe with 2947 obs. of 1 variable, which read table subject_test.txt

*_data : dataframe of merging train and test data set

features : dataframe with f561 obs. of 2 variables, which read table feature.txt

featureWanted : extract only the measurements on the mean and standard deviation for each measurement.

activity : descriptive activity name (walking, walking upstairs, walking downstairs, etc) which read from activity_label.txt

allData : data set which binds x)data, y_data, and subject_data

meanData : average of each variable for each activity and each subject

result.txt : tidy data set, result of this course
