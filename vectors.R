# R is a language of vectors.  In other words, R provides numerous functions
# that loop through a vector or data frame for you.  The loop is built into the 
# function and executes implicitly for you.

vctr <- which(arsenic$usedrink == "E")
arsenic$usedrinkpct[vctr] <- "> 3/4"

# Create a new variable usedrinkpct and update it with the correct percentage,
# depending on the value in the categorical variable usedrink.  The first
# assignment adds the variable (column) to the dataframe.

arsenic$usedrinkpct[arsenic$usedrink == "A"] <- "< 1/4"
arsenic$usedrinkpct[arsenic$usedrink == "B"] <- "~ 1/4"
arsenic$usedrinkpct[arsenic$usedrink == "C"] <- "~ 1/2"
arsenic$usedrinkpct[arsenic$usedrink == "D"] <- "~ 3/4"
arsenic$usedrinkpct[arsenic$usedrink == "E"] <- "> 3/4"


# R also has an ifelse function that can be applied once to the dataframe.
arsenic$usedrinkpct <- ifelse(ars.1$usedrink == "E", ">3/4",
                              ifelse(ars.1$usedrink == "A", "<1/4", "NA"))

# Calculate the probabilities of a flower being left-handed when p = .25 and the number of trials = 27.  
# Then plot the results, producing figure 7.1-1 in Analysis of Biological Data.

left.pr <- rep(0, 28)           # Vector of Pr[left-handed flower].  (Pr = Probability)
left.n  <- 0:27                 # Vector of number of left-handed flowers.

for (idx in 1:length(left.n)) {
  left.pr[idx] <- dbinom(x = (idx - 1), size = 27, prob = .25) 
}

plot(x = left.n, y = left.pr, type = "h", lwd = 8, col = "lightblue", 
     xlab = "Number of left-handed flowers", ylab = "Probability", ylim = c(0, 0.20))

# Now do the same thing with a functional programming approach, using sapply() instead of
# writing loop code to manually step through each trial.

left.pr <- sapply(left.n, function(left.n) {dbinom(x = left.n, size = 27, prob = .25)})

plot(x = left.n, y = left_hand.pr, type = "h", lwd = 8, col = "lightblue", 
     xlab = "Number of left-handed flowers", ylab = "Probability", ylim = c(0, 0.20))

