v <- c(1,2,2,2,3,3,3,4,4,5)
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

hist(v, breaks = c(0,1,2,3,4,5), col = "lightblue", main = "Histogram")

