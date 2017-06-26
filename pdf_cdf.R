rdm_data <- rnorm(n = 100, mean = 3, sd = .5)

hist(rdm_data)

pdf_data <- dnorm(rdm_data, mean = 3, sd = .5)
cdf_data <- pnorm(rdm_data, mean = 3, sd = .5)

all_data <- data.frame(rdm_data, pdf_data, cdf_data)

head(all_data)

plot(rdm_data, pdf_data)
plot(rdm_data, cdf_data)