# PART 2
# setwd('/users/danielt/dropbox/r/hopkins/assignment1')
complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        # Set the files matrix
        files = dir(directory, full.names = T)
        
        
        # initialize the dataframe
        dat = data.frame()
        
        # create the data frame to read all data into one matrix
        for (i in id) {
                dat = rbind(dat, read.csv(files[i]))
        }
        
        # filter for complete cases only
        dat = dat[complete.cases(dat),]
        
        # a new data frame for completely observed cases
        dat2 = data.frame()
        
        for (a in id){
                temp = subset(dat,dat$ID == a)
                dat2 = rbind(dat2,c(a,nrow(temp)))
        }
        
        colnames(dat2) = c('id','nobs')
        
        dat2        
}

