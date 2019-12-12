library(pwr)

p.t.two <- pwr.t.test(d=0.5, power = 0.8, type = "two.sample", 
                      sig.level = .01, alternative = "two.sided")

plot(p.t.two)
plot(p.t.two, xlab="sample size per group")

cohen.ES(test = 't', size = 'large')
