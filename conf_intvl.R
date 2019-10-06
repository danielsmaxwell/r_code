# -------------------------------------------------------------------------------
# This sample code shows how to create a basic graph with 95% confidence interval 
# bars.  Note: the CI calculation is  t * sdev / sqrt(N).  Of course, t is the t 
# table value for a given degree of freedom (DF), calculated as N - 1.
#
# Information about plotting confidence intervals in ggplot2 can be found at:
#    https://www.quora.com/How-do-you-graph-a-confidence-interval-in-ggplot2-R
# -------------------------------------------------------------------------------

# Generate a vector of numbers.

tmp <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)

# The t-test function calculates confidence intervals. 

t_test <- t.test(tmp)

ci_low  <- t_test$conf.int[1]
ci_high <- t_test$conf.int[2]

tmp_mean <- mean(tmp)

x <- 1

# Plot the mean...

plot(x, tmp_mean,
     ylab = 'Mean + 95% CI',
     main = 'Scatter plot w/Confidence Intervals',
     ylim = range(c(ci_high + 1, ci_low - 1)))

# ... and overlay with it confidence interval (CI) bars using the arrow() function.

arrows(x, ci_low, x, ci_high, length = 0.05, angle = 90, code = 3)

# -------------------------------------------------------------------------------
# The plotrix library provides a variety of functions for generating CI plots.
# -------------------------------------------------------------------------------

library(plotrix)

# Generate two vectors of numbers from a uniform distribution...

y   <- runif(10)
err <- runif(10)

# ... and then plot.

plotCI(1:10, y, err, main = 'Basic plotCI')



 
