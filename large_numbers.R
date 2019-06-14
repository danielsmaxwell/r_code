# Test the idea that sample mean approaches a population mean as the sample
# size (n) increases

# Generate fake population data, using rnorm().  When the mean and sd arguments
# are not specified, the defaults are as follows: mean = 0, SD = 1.
pop <- rnorm(10000)

# Now we want to sample n individuals from the population and take the sample 
# means. n = 1, 2, 3,...,1000.
n <- 1:1000

# Calculate and store sample means in ml.
m1 <- rep(NA, length(n))
for (i in n) {
  x <- sample(pop, i)
  m1[i] <- mean(x)
}

plot(m1, type="l")

