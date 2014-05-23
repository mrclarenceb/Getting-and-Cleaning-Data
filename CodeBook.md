Origin and decription of data are located at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The following describes the data transformations that R script "run_analysis.R" applies to merge and clean the data sets included in source https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip:
(comments are also included within the script for further details)

1) Merges training and test sets:

(i) X_union (10299 x 561 dataframe) represents the merge between test set test/X_test.txt (2947 x 561 dataframe) with training set train/X_train.txt (7352 x 561 dataframe). Rows represent observations, and columns features.

(ii) y_union (10299 x 1 dataframe) represents the merge of activity ids.


(iii) subjects_union (10299 x 1 dataframe) respresents the merge of the subjects involved in the observations. Header is changed to "subject".

2) 'features_std_mean_indices' is a subsetting vector on features for only mean and standard deviation measurements. It is created by reading and filtering rows for text like 'std()' and 'mean()' in the "features.txt" file.
X_union is then subsetted on the columns to create a 10299 x 66 dataframe as only 66 features meet this filtering criterium.


3) 'activities' is a 6 x 2 vector where the 1st column is the activity id and 2nd the activity label. activities is created by reading "activity_labels.txt", and applying a tolower() transformation on the labels. The activity id column of y_union is then replaced by the activity names of the activities vector, and renamed "activity_name".

4) X_union features column are relabeled and lower-cased with gsub() and tolower() respectively. Parentheses and commas replaced by an empty string; and hyphens with an underscore.

The first tidy data set 'merged_df' is then created as cbind(subjects_union, y_union, X_union), and then written to the r working directory as "merged_tidy_data_set.txt".

5) merged_df_melt (679734 x 4 dataframe) is created on merged_df with "subject" and "activity_name" as the id vector using the reshape2 melt function.
merged_df_aggr (180 x 60 dataframe) is created on merged_df_melt to pivot on the features in the 'variable' column, and  aggregrated as a mean on the 'value' column. The final tidy data set with averages on mean and std features aggregrated by subject and activity is finally written to the R working directory as "merged_tidy_data_set_averages.txt".




