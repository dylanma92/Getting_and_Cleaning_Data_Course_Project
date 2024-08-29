# this function creates data frames for subject and activity text files

subject_or_activity <- function(file) {
    
    header <- str_extract(file, "(?<=/)[:alpha:]+(?=_[:alpha:]+.txt$)")
    
    if (header == "y") {
        readr::read_lines(file) %>%
            tibble() %>%
            mutate_if(is.character, as.numeric) %>%
            rename_with(.cols = 1, ~ "activity")
    }
    
    else {
        readr::read_lines(file) %>%
            tibble() %>%
            mutate_if(is.character, as.numeric) %>%
            rename_with(.cols = 1, ~ header)
    }
    
}

# this function creates data frames for training and test measurement text files

train_or_test <- function(file) {
    
    header_1 <- paste(str_extract(file, "(?<=/)([:alpha:]+_){2}[:alpha:](?=_[:alpha:]+.txt$)"), "mean", sep = "_")
    header_2 <- paste(str_extract(file, "(?<=/)([:alpha:]+_){2}[:alpha:](?=_[:alpha:]+.txt$)"), "sd", sep = "_")
    
    readr::read_lines(file) %>%
        tibble() %>%
        separate_wider_delim(".", delim = " ", names_sep = "_", too_few = "align_start") %>%
        mutate_if(is.character, as.numeric) %>%
        rowwise() %>%
        mutate(mean = mean(c_across(starts_with("._")), na.rm = TRUE), sd = sd(c_across(starts_with("._")), na.rm = TRUE)) %>%
        select(mean, sd) %>%
        rename_with(.cols = c(1, 2), ~ c(header_1, header_2))
}

# use cbind to join the training and test measurement data frames

# this function binds the rows of training and test measurement data frames, label activities, group rows, summarize means, and generate the csv file output

combine_and_process <- function(training_df, test_df) {
    bind_rows(training_df, test_df) %>%
        mutate(activity_label = case_when(activity == 1 ~ "walking",
                                      activity == 2 ~ "walking_upstairs",
                                      activity == 3 ~ "walking_downstairs",
                                      activity == 4 ~ "sitting",
                                      activity == 5 ~ "standing",
                                      activity == 6 ~ "laying"),
           .before = activity) %>%
        select(!(activity)) %>%
        group_by(subject, activity_label) %>%
        summarise(across(ends_with("mean"), mean, .groups = "keep")) %>%
        write_csv(file = "combined_data.csv")
}