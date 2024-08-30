library(tidyverse)

# read text files into data frames

features <- read_table("./UCI HAR Dataset/features.txt", col_names = c("features_id", "feature"))

test_subject <- read_table("./UCI HAR Dataset/test/subject_test.txt", col_names = "subject_id")
test_activity_id <- read_table("./UCI HAR Dataset/test/y_test.txt", col_names = "activity_id")
test_data <- read_table("./UCI HAR Dataset/test/X_test.txt", col_names = features$feature)

train_subject <- read_table("./UCI HAR Dataset/train/subject_train.txt", col_names = "subject_id")
train_activity_id <- read_table("./UCI HAR Dataset/train/y_train.txt", col_names = "activity_id")
train_data <- read_table("./UCI HAR Dataset/train/X_train.txt", col_names = features$feature)

# select mean and sd columns

test_data <- test_data %>% select(contains("mean") | contains("std"))
train_data <- train_data %>% select(contains("mean") | contains("std"))

# bind data frames

test_df <- cbind(test_subject, test_activity_id, test_data)
train_df <- cbind(train_subject, train_activity_id, train_data)

combined_df <- rbind(test_df, train_df)

# match activity_id with activity labels

combined_df <- combined_df %>% mutate(activity_id = case_match(activity_id,
                                                                 1 ~ "walking",
                                                                 2 ~ "walking_upstairs",
                                                                 3 ~ "walking_downstairs",
                                                                 4 ~ "sitting",
                                                                 5 ~ "standing",
                                                                 6 ~ "laying"))

# rename variables with descriptive names

combined_df <- combined_df %>% rename(subject = subject_id, activity = activity_id) %>%
    rename_all(., ~ str_replace_all(., "-mean", "_mean")) %>%
    rename_all(., ~ str_replace_all(., "-std", "_std")) %>%
    rename_all(., ~ str_replace_all(., "Acc", "Accerleration")) %>%
    rename_all(., ~ str_replace_all(., "Gyro", "Gyroscope")) %>%
    rename_all(., ~ str_replace_all(., "BodyBody", "Body"))

# group by subject then activity, and calculate the mean

combined_df <- combined_df %>% group_by(subject, activity) %>%
    summarise(across(everything(), mean), .groups = "keep")

# write the tidy data to a text file

write.table(combined_df, file = "tidy_data.text", row.names = FALSE)