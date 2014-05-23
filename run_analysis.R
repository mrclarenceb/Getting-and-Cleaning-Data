library("reshape2") #used for functions dcast and melt for step 5 of assignment


### 1. Merges the training and the test sets to create one data set (for X, y, and subjects).

X_union <- rbind(read.table("train/X_train.txt", na.strings = "N/A"), 
                  read.table("test/X_test.txt", na.strings = "N/A")
                  )


y_union <- rbind(read.table("train/y_train.txt", na.strings = "N/A"), 
                  read.table("test/y_test.txt", na.strings = "N/A")
)


subjects_union <- rbind(read.table("train/subject_train.txt", na.strings = "N/A"), 
                  read.table("test/subject_test.txt", na.strings = "N/A")
)

#renames subjects header to "subject"
names(subjects_union) <- "subject"




### 2. Creates features_std_mean_indices vector used to extract only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")

features_std_mean_indices <- grep("(std\\(\\))|(mean\\(\\))", features[,2], value = F)

#  extracts only the measurements on the mean and standard deviation for each measurement.
X_union <-  X_union[,features_std_mean_indices] 




### 3. Uses descriptive activity names to name the activities in the data set

# transforms activity labels, and renames header to "activity_name"
activities <- read.table("activity_labels.txt", na.strings = "N/A", stringsAsFactors = F)

activities[,2] <- tolower(activities[,2])

y_union[,1] <- activities[y_union[,1],2]

names(y_union)[1] <- "activity_name"




### 4. Appropriately labels the data set with descriptive activity names.

names(X_union) <- features[features_std_mean_indices,2]

names(X_union)  <- gsub("[\\(\\)\\,]","",names(X_union))

names(X_union)  <- tolower(gsub("-","_",names(X_union)))



# creates a first merged tidy data set "merged_df", and writes it ("merged_tidy_data_set.txt") to working directory
merged_df <- cbind(subjects_union, y_union, X_union)

write.table(merged_df, "merged_tidy_data_set.txt", row.names = F)



### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

merged_df_melt <- melt(merged_df, id=c("subject", "activity_name"))

merged_df_aggr <- dcast(merged_df_melt, subject + activity_name ~ variable, mean)

write.table(merged_df_aggr, "merged_tidy_data_set_averages.txt", row.names = F)
