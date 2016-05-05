###Codebook
========================================================

Data Set Information:

  The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

  The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

  Attribute Information:

    For each record in the dataset it is provided:
    - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
    - Triaxial Angular velocity from the gyroscope.
    - Its activity label.

  Citation Request:

  [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Process

The script `run_analysis.R` performs the following:
 - extracts table contents from Subject, x and y text files
 - extracts columns that contain mean and Std in features.txt file
 - extracts columsn containing the above
 - combines all data intp one file ready for output


### Variables

- subjtest - table contents of `test/subject_test.txt`
- subjtrain - table contents of `test/subject_train.txt`
- subj - Subjects. Combined data set of the two above variables
- xtest - table contents of `test/X_test.txt`
- xtrain - table contents of `train/X_train.txt`
- x - Measurement data. Combined data set of the two above variables
- ytest - table contents of `test/y_test.txt`
- ytrain - table contents of `train/y_train.txt`
- y - Data Labels. Combined data set of the two above variables. 
- features - table contents of `features.txt`
- meanAndStd - rownumbers corresponding to mean and STd measurements in features.txt file
- xmeanAndStd - columsn extracted from x corresponding to mean and STd measurements
- activity - table contents of `activity_labels.txt`
- cleandata - data ready for output.
- avgactivity - second dataset with average of each variable for each activity and subject

### Output

#### cleandata.txt3

- The first column contains subject IDs.
- next 66 columns are measurements
- last columns is the activity.

#### avgactivity.txt

- The first column contains subject IDs.
- the remaining columsn have the averages for each activity
