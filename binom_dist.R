# R code for the examples found in chapter 7 (The binomial distribution) of The Analysis of Biological Data.
# See http://www.r-tutor.com/elementary-statistics/probability-distributions/binomial-distribution

# This calculates the probability that 3 wasps are male from a random sample (trial) of 5 wasps
# where each wasp has a probability p = 0.2 of being male (p. 153).

dbinom(x = 3, size = 5, prob = 0.2)

# This calculates the probability of getting exactly 6 left-handed flowers from 27 randomly chosen
# flowers where the probability of being left-handed = .25 (p. 154)

dbinom(x = 6, size = 27, prob = 0.25)

# Calculate the probabilities of a flower being left-handed when p = .25 and the number of trials = 27.  
# Then plot the results, producing figure 7.1-1 in Analysis of Biological Data.

left_hand.cnt <- 0:27
left_hand.pr  <- rep(0, 28)  

for (idx in 1:28) {
  left_hand.pr[idx] <- dbinom(x = (idx - 1), size = 27, prob = .25) 
}

plot(x = left_hand.cnt, y = left_hand.pr, type = "h", lwd = 8, ylim = c(0, 0.20), 
     col = "lightblue", xlab = "Number of left-handed flowers", ylab = "Probability")

barplot(left_hand.pr, left_hand.cnt, col = "lightblue")

# This calculates the probability of getting exactly 10 out of 25 genes on the X chromosome, when
# the probability of being on the X chromosome is 0.061 (p. 159).

dbinom(x = 10, size = 25, prob = 0.061)

