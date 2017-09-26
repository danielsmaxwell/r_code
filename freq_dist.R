# Page 37 dataset.

r <- c(1,2,2,2,3,3,3,4,4,5)
X <- c(5,4,3,2,1)
f <- c(1,2,3,3,1)

fX <- X * f
p  <- f / sum(f) 
cp <- cumsum(rev(p))

# Create a dataframe and assign names to each column.  We assign names because
# the last column of df is named "rev.cp" after creation of the dataframe.

df <- data.frame(X, f, fX, p, rev(cp))
colnames(df) <- c("X","f","fX","p","cp")

# Plot the histogram, using the raw dataset.

hist(r, breaks = c(0,1,2,3,4,5), col = "lightblue", main = "Histogram")

# ---------------------------------------------------------------------------
# Answer to Problem 19.

r  <- c(5,5,6,6,6,6,6,7,7,7,7,7,7,8,8,8)
X  <- c(8,7,6,5)
f  <- c(3,6,5,2)
cf <- c(18,15,9,4)
cp <- c(72,60,36,16)

# Calculate the percentile rank for X = 6
y <- .5 * (cp[3] - cp[4])
cp[3] - y

# Calculate the percentile rank for X = 7
y <- .5 * (cp[2] - cp[3])
cp[2] - y

# Calculate the 20th percentile
numerator   <- cp[3] - 20
denominator <- cp[3] - cp[4]

pct <- numerator/denominator  

# Multiply 1 by the percent because there is a 1 point
# difference between the X values.  Add .5 to the upper
# X value to account for bin width.

6.5 - (1 * pct)

# Calculate the 66th percentile
numerator   <- cp[1] - 66
denominator <- cp[1] - cp[2]

pct <- numerator/denominator  

# Multiply 1 by the percent because there is a 1 point
# difference between the X values.  Add .5 to the upper
# X value to account for bin width.

8.5 - (1 * pct)


