
# Get the raw data from github.
roster <- read.csv("https://github.com/danielsmaxwell/r_education/raw/master/data/roster_6166.csv")

# Create a table of counts for each major listed in the roster and then sort it.
majors <- table(roster$MAJOR.NAME)    
majors <- sort(majors)              
                              
# Adjust plot margins.
par(las = 2, mar = c(5, 11, 4, 2))   

barplot(majors, 
        horiz = TRUE, 
        xlim  = range(0:24),
        axes  = FALSE,
        col   = 'khaki3',
        cex.names = 0.5)

# Add a custom axis to the plot.
axis(1, at = seq(0, 24, by = 1), cex.axis = 0.75)
 
