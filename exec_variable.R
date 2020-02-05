
# To execute R code embedded in a string variable, use the eval and parse functions as demonstrated below.

mytext <- "test <- c(1, 2, 3, 4, 5)"
eval(parse(text = mytext))
test
