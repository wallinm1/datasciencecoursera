# Getting and Cleaning Data -- Course Project -- CODEBOOK

This is the codebook for the tidied  ``tidyData.txt``-dataset that we were asked to clean up for the course project.

## Dataset
The tidied `tidyData.txt `-dataset consists of 180 rows and 68 columns. Each row of the dataset gives the average accelerometer signal measurements of 66 different variables for a given subject/activity-combination. The subject-column gives the number of the test subject and the activity-column gives the type of activity as a string.

### Source information
The tidy dataset was generated with the `run_analysis.R`-script which can be found in the same Github-repo as this codebook (see also the `README.md`-script for more detailed comments on the script).

#### Raw data (copy-pasted from README.txt)
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

#### Credits
Human Activity Recognition Using Smartphones Dataset

Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Università degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

www.smartlab.ws

## Variables
There are both categorical and numeric variables in the dataset.
###Categorical variables
Two of the variable columns are categorical in nature: the subject column, which gives the number of the test subject, and the activity column which gives the type of activity as a string. The variables are explained in some more detail below.
* "subject" 
    * The test subject number as an integer ranging between 1 and 30.
* "activity" 
    * The activity type as a string. Six different alternatives: ``"LAYING"`` , ``"SITTING"``, ``"STANDING"``, ``"WALKING"``, ``"WALKING_DOWNSTAIRS"``, and ``"WALKING_UPSTAIRS"``

### Numeric variables
The remaining 66 variable columns are numeric. These columns give the average value of a particular measured and/or processed accelerometer signal for the given subject/activity-pair. The original features are normalized and bounded within [-1, 1], and thereby the averages are as well. There are two types of averages, average means and average standard deviations. The average means are identified by the presence of `mean` in the variable name. Similarly, the presence of `std`in the variable name indicates an average standard deviation measurement. See the `README.md` for a description of how the columns were chosen using R's `grep`-command. The chosen variables are listed below.
* "tBodyAcc.mean...X"
* "tBodyAcc.mean...Y"
* "tBodyAcc.mean...Z"
* "tBodyAcc.std...X"
* "tBodyAcc.std...Y"
* "tBodyAcc.std...Z"
* "tGravityAcc.mean...X"
* "tGravityAcc.mean...Y"
* "tGravityAcc.mean...Z"
* "tGravityAcc.std...X"
* "tGravityAcc.std...Y"
* "tGravityAcc.std...Z"
* "tBodyAccJerk.mean...X"
* "tBodyAccJerk.mean...Y"
* "tBodyAccJerk.mean...Z"
* "tBodyAccJerk.std...X"
* "tBodyAccJerk.std...Y"
* "tBodyAccJerk.std...Z"
* "tBodyGyro.mean...X"
* "tBodyGyro.mean...Y"
* "tBodyGyro.mean...Z"
* "tBodyGyro.std...X"
* "tBodyGyro.std...Y"
* "tBodyGyro.std...Z"
* "tBodyGyroJerk.mean...X"
* "tBodyGyroJerk.mean...Y"
* "tBodyGyroJerk.mean...Z"
* "tBodyGyroJerk.std...X"
* "tBodyGyroJerk.std...Y"
* "tBodyGyroJerk.std...Z"
* "tBodyAccMag.mean.."
* "tBodyAccMag.std.."
* "tGravityAccMag.mean.."
* "tGravityAccMag.std.."
* "tBodyAccJerkMag.mean.."
* "tBodyAccJerkMag.std.."
* "tBodyGyroMag.mean.."
* "tBodyGyroMag.std.."
* "tBodyGyroJerkMag.mean.."
* "tBodyGyroJerkMag.std.."
* "fBodyAcc.mean...X"
* "fBodyAcc.mean...Y"
* "fBodyAcc.mean...Z"
* "fBodyAcc.std...X"
* "fBodyAcc.std...Y"
* "fBodyAcc.std...Z"
* "fBodyAccJerk.mean...X"
* "fBodyAccJerk.mean...Y"
* "fBodyAccJerk.mean...Z"
* "fBodyAccJerk.std...X"
* "fBodyAccJerk.std...Y"
* "fBodyAccJerk.std...Z"
* "fBodyGyro.mean...X"
* "fBodyGyro.mean...Y"
* "fBodyGyro.mean...Z"
* "fBodyGyro.std...X"
* "fBodyGyro.std...Y"
* "fBodyGyro.std...Z"
* "fBodyAccMag.mean.."
* "fBodyAccMag.std.."
* "fBodyBodyAccJerkMag.mean.."
* "fBodyBodyAccJerkMag.std.."
* "fBodyBodyGyroMag.mean.."
* "fBodyBodyGyroMag.std.."
* "fBodyBodyGyroJerkMag.mean.."
* "fBodyBodyGyroJerkMag.std.."


#### Feature description (copy-pasted from features_info.txt)
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag