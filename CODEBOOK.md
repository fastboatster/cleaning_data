## Workflow

1. First, extract variable names for a 561-feature vector with time and frequency domain variables from the file "features.txt"    
2. Created 2 vectors containing positions of any variables with names containing "-std" and "mean", respecitively. 
These vectors will be later used for subsetting the appropriate columns from the data frame with 561-feature vectors
3. Switched to the "train" folder and loaded "X_train.txt", "subject_train.txt" and "y_train.txt" into the appropriate data frames.
These data frames contain 561-feature vectors, subject numbers and activity numbers as their records, respectively
4. Merged these data frames side-by-side in the following order: subject, activity codes and then a feature vector
5. Switched to the "test" folder and repeated the process outlined in 3 and 4 for the test data
6. Merged 2 data frames from 4 and 5 to obtain a data frame with combined train and test data
7. Added column names to the combined data set using variable names from 1 and naming 1st and 2nd columns as "subject" and "activity", respectively
8. Selected only columns 1, 2 and columns fromt he feature vector which contain std and mean variables by using 2 vectors from 2
9. Converted an "activity" column to a factor with 6 levels: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"
10. Ordered the resulting dataset by "subject" column
11. Grouped the data set by subject and activity and summarized all other columns using mean function.
12. Output the data set as "output.txt"

## Variable Description

1. **Descriptive variables.**

 **subject**     - volunteer number (1..30)
 
 **activity**           - factor variable which indicates activity performed by the volunteer 
        
        WALKING
        WALKING_UPSTAIRS
        WALKING_DOWNSTAIRS
        SITTING
        STANDING
        LAYING

2. **Variables extracted from 561-feature vector.**
As per readme.txt and features_info.txt files of the original data set, these variables are from the accelerometer (Acc) and gyroscope (Gyro) 3-axial signals.
Each name is composed of the following elements, in that order and layout:

        domainNAME-VAR-DIM

**domain** values:

        t - time domain signals.
        f - frequency domain signals obtained through FFT-processing.    

**NAME**

        BodyAcc         - body component of the accelerometer signal
        GravityAcc      - gravity component of the accelerometer signal
        BodyAccJerk     - body component of the accelerometer jerk signal
        BodyGyro        - body component of the gyroscope signal
        BodyGyroJerk    - body component of the gyroscope jerk signal
        BodyAccMag      - magnitude of the body component of the accelerometer signal
        GravityAccMag   - magnitude of the gravity component of the accelerometer signal
        BodyAccJerkMag  - magnitude of the body component of the accelerometer jerk signal
        BodyGyroMag     - magnitude of the body component of the gyroscope signal
        BodyGyroJerkMag - magnitude of the body component of the gyroscope jerk signal
        
**VAR**

        mean()  - mean value of the signal
        std()   - standard deviation of the signal

**DIM** (optional)
        
        X - signal in X direction
        Y - signal in Y direction
        Z - signal in Z direction
        
        
