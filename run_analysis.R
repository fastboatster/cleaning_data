run_analysis <- function(){
        
        require(dplyr)
        ## let's merge data and training sets:
        ##but first, load column names:
        col_names <- read.table("features.txt", sep = " ", stringsAsFactors = FALSE)[,2]
        ##create mask vectors for subsetting the dataframes:
        mask_std <- grep("-std", col_names)
        mask_mean <- grep("-mean", col_names)
        ## save working dir:
        root_wd <- getwd()
        ## process training set:
        setwd("train")
        ## read the text files into the data frames:
        train_fr <- read.table("X_train.txt", header= FALSE, strip.white = TRUE)
        train_subj <- read.csv("subject_train.txt", header = FALSE)
        activity_fr <- read.csv("y_train.txt", header = FALSE)
        ## merge these data frames side by side:
        tr_frame <- cbind(train_subj, activity_fr, train_fr)
        ## process the test set analogously to the training set:
        setwd(root_wd)
        setwd("test")
        test_fr <- read.table("X_test.txt", header= FALSE, strip.white = TRUE)
        test_subj <- read.csv("subject_test.txt", header = FALSE)
        test_activity_fr <- read.csv("y_test.txt", header = FALSE)
        te_frame <- cbind(test_subj, test_activity_fr, test_fr)
        ##merge training and testing data frames by rows
        merged_fr <- rbind(tr_frame, te_frame)
        ##add names to the data frame
        names(merged_fr) <- c("subject", "activity", col_names)
        ## we need to keep in mind that subsetting indices need to be 
        ## incremented by 2 after we added two extra columns:
        subsetting_mask <- c(1, 2, mask_std + 2, mask_mean + 2)
        ##reset working directory
        setwd(root_wd)
        ##subset the data frame:
        new_fr <- merged_fr[,subsetting_mask]
        ##transfrom column with activities to a factor:
        new_fr$activity <- cut(new_fr$activity, breaks = 6, labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
        
        ## and order the resulting dataframe by subject:
        new_fr <- arrange(new_fr, subject)
        ## now need to average the variables by grouping them by subject and activity,
        ## and summarize all the columns applying mean function:
        new_fr %>%
                group_by_(.dots = names(new_fr)[c(1,2)]) %>%
                summarize_each(funs(mean)) %>% write.table(file= "output.txt", row.names = FALSE)
                
}
