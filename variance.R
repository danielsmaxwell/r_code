# This code is a simulation of an argument made by Rand Wilcox in his book,
# Fundamentals of Modern Statistical Methods, chapter 7 specifically.  More to
# the point, Wilcox argues that power decreases as variance increases.  That is,
# variance is incredibly sensitive to outliers.  And power, Wilcox notes, is
# "inversely related to the population variance" (p. 113).  Indeed, the curves
# of two distributions (one with and one without an outlier) look identical, as
# demonstrated in the code below.  However, the effect will be much harder to
# detect when outliers are present as the variance is higher.

opar <- par(no.readonly = TRUE)
par(mfrow = c(2, 2))

# Generate a set of 100 random numbers from a normal distribution.
tst <- rnorm(n = 100, mean = 0, sd = 1)

# Generate a histogram of the original vector.
hist(tst, breaks = seq(from = -4, to = 4, by = 1), 
          main   = "Histogram",
          xlim   = range(-3:3),
          col    = "lightgreen")

# Generate a density plot of the vector and add a curve to it.
hist(tst, freq = FALSE, 
     breaks = seq(from = -4, to = 4, by = 1),
     main   = "Density", 
     col    = "lightgreen")

curve(dnorm(x, mean = mean(tst), sd = sd(tst)), 
      add = TRUE, 
      col = "darkblue", 
      lwd = 1)
 
var(tst)              # Check variance.

tst[101] <- 10        # Add an outlier.

var(tst)              # Check variance.

# Generate a histogram of the modified vector.
hist(tst, breaks = seq(from = -4, to = 10, by = 1), 
          main   = "Histogram",
          xlim   = range(-3:10),
          col    = "lightgreen")

# Generate a density plot of the modified vector and add a curve to it.
hist(tst, freq = FALSE, 
     breaks = seq(from = -4, to = 10, by = 1),
     main   = "Density", 
     col    = "lightgreen")

curve(dnorm(x, mean = mean(tst), sd = sd(tst)), 
      add = TRUE, 
      col = "darkblue", 
      lwd = 1)

par(opar)
 
