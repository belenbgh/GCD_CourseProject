##################################################################
###
### Geting and Cleaning Data
###
### Course Project CodeBook.md
###
##################################################################

##### Content description of "mean_std_averages_by_activity_and_subject.txt" file.

This text file is obtained running the R script "run_analysis.R", both - file and script - to mett the requirements of the Coursera course "Getting and Cleaning Data" course project.

The original data and information about it can be found in http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The text file contains 181 rows and 68 space separated columns; briefly:
- First row is the header of the file, containg the column names
- Each row after this, corresponds to values of an observation for a particular subject and a particular activity
- First two columns identify the  subject and the activity
- Subsequent columns correspond to average values of the measurement whose names stand for

###### Column description:

1. subject_id : (int) Identifier of the subject. Values from 1 to 30.
2. activity_desc : (character) Description of the activity peformanced by the subject. Values WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING.
3. tBodyAcc-mean()-X : (num) Average of all the measurements of the feature 'tBodyAcc-mean()-X' for particular subject and activity.
4. tBodyAcc-mean()-Y : (num) Average of all the measurements of the feature 'tBodyAcc-mean()-Y' for particular subject and activity.
5. tBodyAcc-mean()-Z : (num) Average of all the measurements of the feature 'tBodyAcc-mean()-Z' for particular subject and activity.
6. tBodyAcc-std()-X : (num) Average of all the measurements of the feature 'tBodyAcc-std()-X' for particular subject and activity.
7. tBodyAcc-std()-Y : (num) Average of all the measurements of the feature 'tBodyAcc-std()-Y' for particular subject and activity.
8. tBodyAcc-std()-Z : (num) Average of all the measurements of the feature 'tBodyAcc-std()-Z' for particular subject and activity.
9. tGravityAcc-mean()-X : (num) Average of all the measurements of the feature 'tGravityAcc-mean()-X' for particular subject and activity.
10. tGravityAcc-mean()-Y : (num) Average of all the measurements of the feature 'tGravityAcc-mean()-Y' for particular subject and activity.
11. tGravityAcc-mean()-Z : (num) Average of all the measurements of the feature 'tGravityAcc-mean()-Z' for particular subject and activity.
12. tGravityAcc-std()-X : (num) Average of all the measurements of the feature 'tGravityAcc-std()-X' for particular subject and activity.
13. tGravityAcc-std()-Y : (num) Average of all the measurements of the feature 'tGravityAcc-std()-Y' for particular subject and activity.
14. tGravityAcc-std()-Z : (num) Average of all the measurements of the feature 'tGravityAcc-std()-Z' for particular subject and activity.
15. tBodyAccJerk-mean()-X : (num) Average of all the measurements of the feature 'tBodyAccJerk-mean()-X' for particular subject and activity.
16. tBodyAccJerk-mean()-Y : (num) Average of all the measurements of the feature 'tBodyAccJerk-mean()-Y' for particular subject and activity.
17. tBodyAccJerk-mean()-Z : (num) Average of all the measurements of the feature 'tBodyAccJerk-mean()-Z' for particular subject and activity.
18. tBodyAccJerk-std()-X : (num) Average of all the measurements of the feature 'tBodyAccJerk-std()-X' for particular subject and activity.
19. tBodyAccJerk-std()-Y : (num) Average of all the measurements of the feature 'tBodyAccJerk-std()-Y' for particular subject and activity.
20. tBodyAccJerk-std()-Z : (num) Average of all the measurements of the feature 'tBodyAccJerk-std()-Z' for particular subject and activity.
21. tBodyGyro-mean()-X : (num) Average of all the measurements of the feature 'tBodyGyro-mean()-X' for particular subject and activity.
22. tBodyGyro-mean()-Y : (num) Average of all the measurements of the feature 'tBodyGyro-mean()-Y' for particular subject and activity.
23. tBodyGyro-mean()-Z : (num) Average of all the measurements of the feature 'tBodyGyro-mean()-Z' for particular subject and activity.
24. tBodyGyro-std()-X : (num) Average of all the measurements of the feature 'tBodyGyro-std()-X' for particular subject and activity.
25. tBodyGyro-std()-Y : (num) Average of all the measurements of the feature 'tBodyGyro-std()-Y' for particular subject and activity.
26. tBodyGyro-std()-Z : (num) Average of all the measurements of the feature 'tBodyGyro-std()-Z' for particular subject and activity.
27. tBodyGyroJerk-mean()-X : (num) Average of all the measurements of the feature 'tBodyGyroJerk-mean()-X' for particular subject and activity.
28. tBodyGyroJerk-mean()-Y : (num) Average of all the measurements of the feature 'tBodyGyroJerk-mean()-Y' for particular subject and activity.
29. tBodyGyroJerk-mean()-Z : (num) Average of all the measurements of the feature 'tBodyGyroJerk-mean()-Z' for particular subject and activity.
30. tBodyGyroJerk-std()-X : (num) Average of all the measurements of the feature 'tBodyGyroJerk-std()-X' for particular subject and activity.
31. tBodyGyroJerk-std()-Y : (num) Average of all the measurements of the feature 'tBodyGyroJerk-std()-Y' for particular subject and activity.
32. tBodyGyroJerk-std()-Z : (num) Average of all the measurements of the feature 'tBodyGyroJerk-std()-Z' for particular subject and activity.
33. tBodyAccMag-mean() : (num) Average of all the measurements of the feature 'tBodyAccMag-mean()' for particular subject and activity.
34. tBodyAccMag-std() : (num) Average of all the measurements of the feature 'tBodyAccMag-std()' for particular subject and activity.
35. tGravityAccMag-mean() : (num) Average of all the measurements of the feature 'tGravityAccMag-mean()' for particular subject and activity.
36. tGravityAccMag-std() : (num) Average of all the measurements of the feature 'tGravityAccMag-std()' for particular subject and activity.
37. tBodyAccJerkMag-mean() : (num) Average of all the measurements of the feature 'tBodyAccJerkMag-mean()' for particular subject and activity.
38. tBodyAccJerkMag-std() : (num) Average of all the measurements of the feature 'tBodyAccJerkMag-std()' for particular subject and activity.
39. tBodyGyroMag-mean() : (num) Average of all the measurements of the feature 'tBodyGyroMag-mean()' for particular subject and activity.
40. tBodyGyroMag-std() : (num) Average of all the measurements of the feature 'tBodyGyroMag-std()' for particular subject and activity.
41. tBodyGyroJerkMag-mean() : (num) Average of all the measurements of the feature 'tBodyGyroJerkMag-mean()' for particular subject and activity.
42. tBodyGyroJerkMag-std() : (num) Average of all the measurements of the feature 'tBodyGyroJerkMag-std()' for particular subject and activity.
43. fBodyAcc-mean()-X : (num) Average of all the measurements of the feature 'fBodyAcc-mean()-X' for particular subject and activity.
44. fBodyAcc-mean()-Y : (num) Average of all the measurements of the feature 'fBodyAcc-mean()-Y' for particular subject and activity.
45. fBodyAcc-mean()-Z : (num) Average of all the measurements of the feature 'fBodyAcc-mean()-Z' for particular subject and activity.
46. fBodyAcc-std()-X : (num) Average of all the measurements of the feature 'fBodyAcc-std()-X' for particular subject and activity.
47. fBodyAcc-std()-Y : (num) Average of all the measurements of the feature 'fBodyAcc-std()-Y' for particular subject and activity.
48. fBodyAcc-std()-Z : (num) Average of all the measurements of the feature 'fBodyAcc-std()-Z' for particular subject and activity.
49. fBodyAccJerk-mean()-X : (num) Average of all the measurements of the feature 'fBodyAccJerk-mean()-X' for particular subject and activity.
50. fBodyAccJerk-mean()-Y : (num) Average of all the measurements of the feature 'fBodyAccJerk-mean()-Y' for particular subject and activity.
51. fBodyAccJerk-mean()-Z : (num) Average of all the measurements of the feature 'fBodyAccJerk-mean()-Z' for particular subject and activity.
52. fBodyAccJerk-std()-X : (num) Average of all the measurements of the feature 'fBodyAccJerk-std()-X' for particular subject and activity.
53. fBodyAccJerk-std()-Y : (num) Average of all the measurements of the feature 'fBodyAccJerk-std()-Y' for particular subject and activity.
54. fBodyAccJerk-std()-Z : (num) Average of all the measurements of the feature 'fBodyAccJerk-std()-Z' for particular subject and activity.
55. fBodyGyro-mean()-X : (num) Average of all the measurements of the feature 'fBodyGyro-mean()-X' for particular subject and activity.
56. fBodyGyro-mean()-Y : (num) Average of all the measurements of the feature 'fBodyGyro-mean()-Y' for particular subject and activity.
57. fBodyGyro-mean()-Z : (num) Average of all the measurements of the feature 'fBodyGyro-mean()-Z' for particular subject and activity.
58. fBodyGyro-std()-X : (num) Average of all the measurements of the feature 'fBodyGyro-std()-X' for particular subject and activity.
59. fBodyGyro-std()-Y : (num) Average of all the measurements of the feature 'fBodyGyro-std()-Y' for particular subject and activity.
60. fBodyGyro-std()-Z : (num) Average of all the measurements of the feature 'fBodyGyro-std()-Z' for particular subject and activity.
61. fBodyAccMag-mean() : (num) Average of all the measurements of the feature 'fBodyAccMag-mean()' for particular subject and activity.
62. fBodyAccMag-std() : (num) Average of all the measurements of the feature 'fBodyAccMag-std()' for particular subject and activity.
63. fBodyBodyAccJerkMag-mean() : (num) Average of all the measurements of the feature 'fBodyBodyAccJerkMag-mean()' for particular subject and activity.
64. fBodyBodyAccJerkMag-std() : (num) Average of all the measurements of the feature 'fBodyBodyAccJerkMag-std()' for particular subject and activity.
65. fBodyBodyGyroMag-mean() : (num) Average of all the measurements of the feature 'fBodyBodyGyroMag-mean()' for particular subject and activity.
66. fBodyBodyGyroMag-std() : (num) Average of all the measurements of the feature 'fBodyBodyGyroMag-std()' for particular subject and activity.
67. fBodyBodyGyroJerkMag-mean() : (num) Average of all the measurements of the feature 'fBodyBodyGyroJerkMag-mean()' for particular subject and activity.
68. fBodyBodyGyroJerkMag-std() : (num) Average of all the measurements of the feature 'fBodyBodyGyroJerkMag-std()' for particular subject and activity.
