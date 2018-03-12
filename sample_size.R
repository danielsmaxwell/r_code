install.packages(c("gapminder", "tidyverse"))

### Case 1
# Testing the idea: sample mean approaches population means
# as sample size (n) increases
# Fake population data, true mean = 0, true SD = 1
pop <- rnorm(10000)

# Now we want to sample n individual from the population
# and take the sample means. n = 1, 2, 3,...,1000.
n <- 1:1000

# Method 1: the for loop way
m1 <- rep(NA, length(n))
for (i in n) {
  x <- sample(pop, i)
  m1[i] <- mean(x)
}

plot(m1, type="l")

