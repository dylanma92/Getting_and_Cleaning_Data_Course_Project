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

## Variables

The raw data was presented in two sets: 70% of the volunteers were
selected for generating the training data and 30% the test data. Each
record in the raw data included:

-   Triaxial acceleration from the accelerometer (total acceleration)
    and the estimated body acceleration
-   Triaxial Angular velocity from the gyroscope
-   A 561-feature vector with time and frequency domain variables
-   Its activity label (1 = walking, 2 = walking upstairs, 3 = walking
    downstairs, 4 = sitting, 5 = standing, 6 = laying)
-   An identifier of the subject who carried out the experiment

## Data Transformations

The script **(run\_analysis.R)** includes three functions which
transform the data:

-   *subject\_or\_activity()* reads the subject or activity data files
    and creates individual data frames
-   *train\_or\_test()* reads the individual “Inertial Signals” data
    files and creates individual data frames
-   use *cbind()* to join the subject, activity, and inertial signal
    data frames for the training and test data sets
-   *combine\_and process()* binds the rows of the training and test
    data frames output from *cbind()*, labels the activity column,
    groups rows, summarize means, and generate the csv file output
