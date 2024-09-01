# CodeBook

## Data

The data was obtained from the Human Activity Recognition Using
Smartphones Dataset Version 1.0. The experimental design involved a
group of 30 volunteers within an age bracket of 19-48 years. Each person
performed six activities (walking, walking upstairs, walking downstairs,
sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on
the waist. Using its embedded accelerometer and gyroscope, the
experiment captured 3-axial linear acceleration and 3-axial angular
velocity at a constant rate of 50Hz. The obtained dataset has been
randomly partitioned into two sets, where 70% of the volunteers was
selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain.

## Variables and Object Class

-   subject : num
-   activity : chr
-   tBodyAccerleration\_mean()-X : num
-   tBodyAccerleration\_mean()-Y : num
-   tBodyAccerleration\_mean()-Z : num
-   tGravityAccerleration\_mean()-X : num
-   tGravityAccerleration\_mean()-Y : num
-   tGravityAccerleration\_mean()-Z : num
-   tBodyAccerlerationJerk\_mean()-X : num
-   tBodyAccerlerationJerk\_mean()-Y : num
-   tBodyAccerlerationJerk\_mean()-Z : num
-   tBodyGyroscope\_mean()-X : num
-   tBodyGyroscope\_mean()-Y : num
-   tBodyGyroscope\_mean()-Z : num
-   tBodyGyroscopeJerk\_mean()-X : num
-   tBodyGyroscopeJerk\_mean()-Y : num
-   tBodyGyroscopeJerk\_mean()-Z : num
-   tBodyAccerlerationMag\_mean() : num
-   tGravityAccerlerationMag\_mean() : num
-   tBodyAccerlerationJerkMag\_mean() : num
-   tBodyGyroscopeMag\_mean() : num
-   tBodyGyroscopeJerkMag\_mean() : num
-   fBodyAccerleration\_mean()-X : num
-   fBodyAccerleration\_mean()-Y : num
-   fBodyAccerleration\_mean()-Z : num
-   fBodyAccerleration\_meanFreq()-X : num
-   fBodyAccerleration\_meanFreq()-Y : num
-   fBodyAccerleration\_meanFreq()-Z : num
-   fBodyAccerlerationJerk\_mean()-X : num
-   fBodyAccerlerationJerk\_mean()-Y : num
-   fBodyAccerlerationJerk\_mean()-Z : num
-   fBodyAccerlerationJerk\_meanFreq()-X : num
-   fBodyAccerlerationJerk\_meanFreq()-Y : num
-   fBodyAccerlerationJerk\_meanFreq()-Z : num
-   fBodyGyroscope\_mean()-X : num
-   fBodyGyroscope\_mean()-Y : num
-   fBodyGyroscope\_mean()-Z : num
-   fBodyGyroscope\_meanFreq()-X : num
-   fBodyGyroscope\_meanFreq()-Y : num
-   fBodyGyroscope\_meanFreq()-Z : num
-   fBodyAccerlerationMag\_mean() : num
-   fBodyAccerlerationMag\_meanFreq() : num
-   fBodyAccerlerationJerkMag\_mean() : num
-   fBodyAccerlerationJerkMag\_meanFreq() : num
-   fBodyGyroscopeMag\_mean() : num
-   fBodyGyroscopeMag\_meanFreq() : num
-   fBodyGyroscopeJerkMag\_mean() : num
-   fBodyGyroscopeJerkMag\_meanFreq() : num
-   angle(tBodyAccerlerationMean,gravity) : num
-   angle(tBodyAccerlerationJerkMean),gravityMean) : num
-   angle(tBodyGyroscopeMean,gravityMean) : num
-   angle(tBodyGyroscopeJerkMean,gravityMean) : num
-   angle(X,gravityMean) : num
-   angle(Y,gravityMean) : num
-   angle(Z,gravityMean) : num
-   tBodyAccerleration\_std()-X : num
-   tBodyAccerleration\_std()-Y : num
-   tBodyAccerleration\_std()-Z : num
-   tGravityAccerleration\_std()-X : num
-   tGravityAccerleration\_std()-Y : num
-   tGravityAccerleration\_std()-Z : num
-   tBodyAccerlerationJerk\_std()-X : num
-   tBodyAccerlerationJerk\_std()-Y : num
-   tBodyAccerlerationJerk\_std()-Z : num
-   tBodyGyroscope\_std()-X : num
-   tBodyGyroscope\_std()-Y : num
-   tBodyGyroscope\_std()-Z : num
-   tBodyGyroscopeJerk\_std()-X : num
-   tBodyGyroscopeJerk\_std()-Y : num
-   tBodyGyroscopeJerk\_std()-Z : num
-   tBodyAccerlerationMag\_std() : num
-   tGravityAccerlerationMag\_std() : num
-   tBodyAccerlerationJerkMag\_std() : num
-   tBodyGyroscopeMag\_std() : num
-   tBodyGyroscopeJerkMag\_std() : num
-   fBodyAccerleration\_std()-X : num
-   fBodyAccerleration\_std()-Y : num
-   fBodyAccerleration\_std()-Z : num
-   fBodyAccerlerationJerk\_std()-X : num
-   fBodyAccerlerationJerk\_std()-Y : num
-   fBodyAccerlerationJerk\_std()-Z : num
-   fBodyGyroscope\_std()-X : num
-   fBodyGyroscope\_std()-Y : num
-   fBodyGyroscope\_std()-Z : num
-   fBodyAccerlerationMag\_std() : num
-   fBodyAccerlerationJerkMag\_std() : num
-   fBodyGyroscopeMag\_std() : num
-   fBodyGyroscopeJerkMag\_std() : num

## Data Transformations

The script **(run\_analysis.R)** transforms the data in the following
ways:

-   reads the text files and creates individual data frames
-   selects the mean and sd columns
-   binds the data frames
-   renames the activity identifiers to activity labels
-   renames variables with descriptive names
-   groups by subjects and activity
-   calculates the mean
-   writes a text file of the tidy data
