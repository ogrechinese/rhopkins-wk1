# PART 3
# setwd('/users/danielt/dropbox/r/hopkins/assignment1')
corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        # Feed data into one large file
        # Create a vector of all of the csv files
        files = dir(directory, full.names = T)

        # Initialize a dataframe dat1 that will be used to store all of the data
        dat1 = data.frame()

        # Use a for loop to loop through each csv file and add contents to dat1
        for (i in 1:length(files)) {
                dat1 = rbind(dat1, read.csv(files[i]))         #NOTE: You missed the closing parentheses here first time
        }                                                       #NOTE: You also forgot read.csv first time
        

        # Count the number of complete cases for each monitor
        # Initialize a numeric vector that will be used to store the correlations
        corr1 = numeric(0)
        
        # Use a for loop to create subset of each monitor's data

        for (i in 1:length(files)) {
                sub1 = subset(dat1, dat1$ID == i)
                
                # Determine how many complete cases there are in the current subset
                complete_count = sum(complete.cases(sub1))
                
                # If statement to determine whether the complete_count is above threshold
                # and if so, then compute the correlation between sulfate and nitrate for current subset
                # and then append that correlation to the corr1 data frame
                                
                if (complete_count > threshold){
                        corr_current = cor(sub1$sulfate, sub1$nitrate, use = 'complete.obs')
                        corr1 = c(corr1, corr_current)
                }
                
        }
        
        #if (nrow(corr1) == 0) {return (numeric(1))}
        #else {(return (corr1))}
        return(corr1)
}