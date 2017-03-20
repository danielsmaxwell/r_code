#
# This code demonstrates the relationship between sample size and standard error.  As such, it
# could be developed into a shiny app, allowing the user to set sample sizes and then see the 
# resultant impact on standard error.  Larger samples = smaller standard error.  Smaller samples = 
# larger standard error.  This relationship would be displayed graphically by the histograms.
#

smp.n  <- 100               # Set the sample size.
sim.n  <- 20                # Set the number of requested simulations.
sim.m  <- rep(NA, sim.n)    # Create a vector to hold the simulated means.
sim.sd <- rep(NA, sim.n)    # Create a vector to hold the simulated standard deviations.
 
                            # Loop for the requested number of simulations, generating a
                            # data set each time and calculating the data set's mean and sd.
for (idx in 1:sim.n) {      

  sim.data <- rnorm(n = smp.n, mean = 3, sd = 1)   
  
  sim.m[idx] <- mean(sim.data)
  sim.sd[idx]   <- sd(sim.data)   
}

se <- sd(sim.m)             # Calculate the sd of the sample means.  This is the se (standard error).

# Create histograms of the mean and standard deviation of our sample distribution.

hist(sim.m, col = "skyblue", main = "Distribution of Simulated Means", xlab = "Means")
hist(sim.sd, col = "skyblue", main = "Distribution of Simulated SD's", xlab = "SD")
