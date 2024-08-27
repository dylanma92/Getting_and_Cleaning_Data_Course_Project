library(tidyverse)

# read text files and assign to objects

X_train <- readr::read_lines("./UCI HAR Dataset/train/X_train.txt")
y_train <- readr::read_lines("./UCI HAR Dataset/train/y_train.txt")
subject_train <- readr::read_lines("./UCI HAR Dataset/train/subject_train.txt")
X_test <- readr::read_lines("./UCI HAR Dataset/test/X_test.txt")
y_test <- readr::read_lines("./UCI HAR Dataset/test/y_test.txt")
subject_test <- readr::read_lines("./UCI HAR Dataset/test/subject_test.txt")

train <- tibble(subject_train,
                y_train,
                X_train) %>% # build a data frame of "train" values
  rename(subject = subject_train,
         activity_label = y_train) %>%
  separate_wider_delim(X_train,
                       delim = " ",
                       names_sep = "_",
                       too_few = "align_start") %>% # separate string in "X_train" column and split into multiple new columns
  mutate_if(is.character,
            as.numeric) %>%
  rowwise() %>%
  mutate(measurement_mean = mean(c_across(starts_with("X_train")), 
                                 na.rm = TRUE), 
         measurement_sd = sd(c_across(starts_with("X_train")), 
                             na.rm = TRUE)) %>% # calculate the mean and sd of columns starting with "X_train"
  select(subject, 
         activity_label, 
         measurement_mean, 
         measurement_sd)

test <- tibble(subject_test,
               y_test,
               X_test) %>% # build a data frame of "test" values
  rename(subject = subject_test,
         activity_label = y_test) %>%
  separate_wider_delim(X_test,
                       delim = " ",
                       names_sep = "_",
                       too_few = "align_start") %>% # separate string in "X_test" column and split into multiple new columns
  mutate_if(is.character,
            as.numeric) %>%
  rowwise() %>%
  mutate(measurement_mean = mean(c_across(starts_with("X_test")), 
                                 na.rm = TRUE), 
         measurement_sd = sd(c_across(starts_with("X_test")), 
                             na.rm = TRUE)) %>% # calculate the mean and sd of columns starting with "X_test"
  select(subject, 
         activity_label, 
         measurement_mean, 
         measurement_sd)

combined_data <- bind_rows(train, test) %>% # combine the rows of data frames "train" and "test"
  mutate(activity = case_when(activity_label == 1 ~ "walking",
                              activity_label == 2 ~ "walking_upstairs",
                              activity_label == 3 ~ "walking_downstairs",
                              activity_label == 4 ~ "sitting",
                              activity_label == 5 ~ "standing",
                              activity_label == 6 ~ "laying"), 
         .before = activity_label) %>% # create a new column "activity" using the values in "activity_label" 
  select(!(activity_label)) # select all columns except "activity_label

combined_data_grouped <- combined_data %>% group_by(subject, activity) %>%
  summarise(activity_mean = mean(measurement_mean, na.rm = TRUE), .groups = "keep") # group rows by "subject" and "activity" then calculate the mean of "measurement_mean"

write_csv(combined_data, file = "combined_data.csv") # write "combined_data" as a csv file
write_csv(combined_data_grouped, file = "combined_data_grouped.csv") # write "combined_data_grouped" as a csv file
