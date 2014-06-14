
# Set the working directory
# setwd('/users/danielt/dropbox/r/hopkins/assignment1')

# PART 1
pollutantmean <- function(directory, pollutant, id = 1:332) {
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        # if to figure out what pollutant is.
        
        # Create a list of the files
        files = dir(directory, full.names = T)
        
        # Create dat, which contains all data for the specified ID's
                # Initialize the dat matrix.
                dat = data.frame()   # WAS MISSING ()
                # Read in the data using a for-loop
                for (i in id) {
                        dat = rbind(dat, read.csv(files[i]))
                }
        
        # If statement to identify the pollutant
                if (pollutant == "sulfate") {
                        mean(dat$sulfate, na.rm = T)
                }
                else if (pollutant == "nitrate") {
                        mean(dat$nitrate, na.rm = T)
                        }
                else {
                        print("The pollutant was not sulfate or nirate.")
                }
}

