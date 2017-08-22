# Author: Raffaele Vacca <r.vacca@ufl.edu>
#
# This file includes all the code chunks shown in R01_objects_operations.pdf.
# Please refer to R01_objects_operations.pdf for further documentation.
#
# License:
# Creative Commons Attribution-NonCommercial-ShareAlike 
# CC BY-NC-SA
# http://creativecommons.org/licenses/by-nc-sa/3.0/


# ------------------------------------------------------------------------------
################################################################################
###                          2. STARTING R                                   ###
################################################################################
## @knitr starting 

# What's the current working directory? 
# getwd() 
# (Delete the leading "#" to actually check your current directory.)

# Change the working directory. 
# setwd("/my/working/directory") 
# (Delete the leading "#" and type in your actual working directory instead of
# "/my/working/directory": this should be the directory where you saved the "Data" folder
# you downloaded for this workshop. E.g.
# setwd("/Users/John/Documents/Rworkshop")).

# Suppose that we want to use the package "ggplot2" in the following code.
library(ggplot2)

# NOTE that we can only load a package if we have it installed. In this case, I
# have igraph already installed. Had this not been the case, I would have have
# needed to install it: 
# install.packages("igraph").
# (Packages can also be installed through a GUI menu item).

# Note that whatever is typed after the "#" sign has no effect but to be printed
# as is in the console: it is a comment.

# Clear the workspace from any existing objects
# (Only needed if we have already done some work in this R session.)
rm(list=ls())


# ------------------------------------------------------------------------------
################################################################################
###                         3.1. OBJECTS IN R                                ###
################################################################################
## @knitr objects 

# Create the object a: assign the value 50 to the name "a"
a <- 50

x <- 2
y <- 40
object <- "abc"

# Display ("print") the object a.
a

# This is the same as:
print(a)

# Let's create another object.
b <- "Mark"

# Display it.
b

# What do we have in our current workspace?
ls()

# Let's do a simple operation.
a + 3

# What if we wanted to save this result?
result <- a + 3

# Now we can call that result whenever we need it.
result

# Let's save a and c to an external file.
save(a, result, file= "mario.rda")

# The file is now in our working directory.

# What's our workspace now?
ls()

# We want to remove "a" and "result", we are not going to use them now.
rm(a, result)

# If we now call "result", R doesn't find it...
result

# ...because it's not in the workspace any more.
ls()

# But we can reload it from the external file we created.
load(file= "myobjects.rda")

# Now result is back here.
ls()

result

# Note that R is case-sensitive, "result" is different from "reSult".
reSult

# Let's clear the workspace before proceeding.
rm(list=ls())

# The workspace is now empty.
ls()



# ------------------------------------------------------------------------------
################################################################################
###                     3.2. VECTOR AND MATRIX OBJECTS                       ###
################################################################################
## @knitr vectors 

# Let's create a simple vector.
x <- c(1, 2, 3, 4)

# Display it.
x

# Shortcut for the same thing.
y <- 1:4

y

# What's the length of x?
length(x)

# Create a vector with the rep() ("repeat") function.
# Repeat argument for 10 times
rep(2, times=10)
rep(1:2, times=10)
# Repeat the number of times that yields a vector of length 8.
rep(1:2, length.out= 8)

# Create a vector with the seq() ("sequence") function.
# 1 to 10 in steps of 2.
seq(from=1, to= 10, by= 2)
# 1 to 10, in steps such as the final vector has 20 elements.
seq(1, 10, length.out=20)
# Check out ?seq for more complicated usage.

# Note that when we print vectors, numbers in square brackets indicate positions
# of the vector elements.

# Create a simple adjacency matrix.
adj <- matrix(c(0,1,0,1,0,0,1,1,0), nrow= 3, ncol=3)

# This is what our matrix looks like:
adj

# Notice the row and column numbers in square brackets. 

# Matrices have dimensions (number of rows, number of columns).
dim(adj)

# Matrices may have rownames and colnames (useful for data management).

# M doesn't have rownames yet.
rownames(adj)

# Let's give names to the rows and the columns of the matrix, i.e. the network
# nodes.
rownames(adj) <- c("Mark", "John", "Mario")
colnames(adj) <- c("Mark", "John", "Mario")
adj


# ------------------------------------------------------------------------------
################################################################################
###            4. ARITHMETIC AND LOGICAL OPERATIONS                          ###
################################################################################
## @knitr operations

# Just a few arithmetic operations between vectors to demonstrate element-wise
# calculations and the recycling rule.

# [1 2 3 4] + [1 2 3 4]
v1 <- 1:4
v2 <- 1:4
v1 + v2

# [1 2 3 4] + 1
v1 <- 1:4
v2 <- 1
v1 + v2

# [1 2 3 4] + [1 2]
v1 <- 1:4
v2 <- 1:2
v1 + v2

# [1 2 3 4] + [1 2 3]
v1 <- 1:4
v2 <- 1:3
v1 + v2

# Now on to comparisons and logical operations.

# Create vector z.
z <- -3:3
z

# Note how the following comparisons are performed element-wise, and the value
# to which z is compared (e.g. 0) is recycled.

# z equal to 0?
z==0

# z greater than 0?
z > 0

# Which elements of z are smaller than -2 OR greater than 1?
z < -2
z > 1
z < -2 | z > 1

# Which elements of z are smaller than -2 AND greater than 1?
z < -2 & z > 1
# Notice the difference between OR (|) and AND (&).

# ***** EXERCISE: 
# Why is everything FALSE in z < -2 & z > 1? 
# *****

# Let's save the 2 results above
r1 <- z > -2
r2 <- z > 2

# The results are logical vectors.
r1
r2

# AND (&): result is TRUE if both are TRUE.
r1 & r2

# OR (|): result is TRUE if either is TRUE.
r1 | r2

# ! is negation: !r2 is TRUE when r2 is FALSE and vice versa.
r2
!r2

# Is 3 in z?
3 %in% z

# Is z in c(2, 3)? That is, which values of z are either 2 or 3?
z %in% c(2, 3)

# You can combine logical operators and logical vectors in many
# useful ways.

# E.g. which values of z are NOT in c(2, 3)?
!(z %in% c(2, 3))

# ***** EXERCISE: 
# Create a logical vector that is TRUE when z is higher than -3 and lower than
# 0.
# *****

# ------------------------------------------------------------------------------
################################################################################
###              4.2.1. TIPS AND TRICKS WITH LOGICALS                        ###
################################################################################
## @knitr tips.logical

# Compare again z to 0.
z
z > 0

z1 <- c(1,0,1,1,1,0,0,0,1,0)

all(z==1)
any(z==1)

# Are all elements of z higher than 0?
all(z > 0)
# But all are higher than -4.
all(z > -4)

# Is there any element of z higher than 0?
any(z > 0)

# Convert a logical to numeric.
z > 0
as.numeric(z > 0)

# How many elements of z are greater than 0?
sum(z > 0)

# What's the proportion of z elements that are greater than 0?
mean(z > 0)

# ***** EXERCISE: 
# How many elements of the vector 1:100 are greater than the length of that
# vector divided by 2? Use sum().
# *****

# ------------------------------------------------------------------------------
################################################################################
###                4.3. BASIC STATISTICAL FUNCTIONS                          ###
################################################################################
## @knitr basic.fun

# Some examples of basic statistical functions.

# Let's extract a vector of 30 random values from a standard normal
# distribution.
set.seed(2306) # Set the seed for reproducibility.
st.norm <- rnorm(30, mean= 0, sd= 1)
st.norm

# Mean and standard deviation of st.norm.
mean(st.norm)
sd(st.norm)
# Pretty close to the actual distribution mean and standard deviation.

# Let's create a fictitious "sex" variable for 10 respondents.
sex <- c(rep("male", 4), rep("female", 6))
sex

# Absolute frequencies of variable values.
table(sex)

# Relative frequencies.
prop.table(table(sex))

# Let's attach some NA values to the vector.
sex <- c(sex, rep(NA, 3))
sex

# Note that R does not compare NA values to numbers. The result of NA== is
# always NA.
sex=="male"

# Which values are NA? 
is.na(sex)

# *NOT* sex==NA
sex==NA

# How many NA values are there?
sum(is.na(sex))


# ***** EXERCISE: 
# What is the range of the st.norm vector?
# *****

# ------------------------------------------------------------------------------
################################################################################
###                       5. BASICS OF R FUNCTIONS                           ###
################################################################################
## @knitr r.functions

# Let's get a vector to calculate its mean.
x <- c(2, 2, NA, 3, 3, 3, NA, 3, 5, 5)

# The mean() function has a "na.rm" argument to indicate what to do about NA 
# values when calculating the mean. The default value of na.rm is FALSE, meaning
# that NA's are not removed. As a result, if the vector includes a NA, its mean
# will also be NA.
mean(x)

# We can overwrite the default value of na.rm to remove NA's before calculating the mean.
mean(x, na.rm=TRUE)

# The mean function also has a "trim" argument, to trim off a fraction (given by
# trim) of values from each end of the vector before calculating the mean.
mean(x, trim=0.3, na.rm=TRUE)

# Note that the function works in the same way even if we do not name the
# arguments -- but we have to keep them in the right order (indicated in the
# manual page.)
mean(x, 0.3, TRUE)

# See what happens if we don't name arguments and do not respect their original order.
mean(x, TRUE, 0.3)

# Because arguments are not named, R uses their order to understand which is 
# which. So to R, the line above means: mean(x, trim= TRUE, na.rm= 0.3), because
# that's the argument order in the function definition and manual page.

# If we do name the arguments, we can change their order, although this is not a
# good practice.
mean(x, na.rm=TRUE, trim=0.3)


# Now let's do a simple example of user-written function. Any piece of code you
# can write and run in R, you can also put in a function.

# Let's write a trivial function that takes its argument and multiplies it by 2.
times2 <- function(x) {
  x*2
}

# Now we can run the function on any argument.
times2(x= 3)
times2(x= 10)
times2(50)

# A function that takes its argument and prints a sentence with it:
myoutput <- function(word) {
  print(paste("My output is", word))
}

# Let's run the function.
myoutput("cat")
myoutput(word= "table")
myoutput("ABC")
# Not necessarily a useful function...

# Note that the function output is the last object that is printed at the end of
# the function body
times2 <- function(x) {
  y <- x*2
  y
}
times2(x=4)
# If nothing is printed, the function returns nothing.
times2 <- function(x) {
  y <- x*2
}
times2(x=4)

# A function will return an error if it's executed on arguments that are not 
# suitable for the code in its body. E.g., R can't multiply "a" by 2...
times2 <- function(x) {
  x*2
}
times2(x= "a")

# To avoid these common errors due to wrong argument type, you can use control
# flow in the function body (e.g. "if" conditions, stopifnot(), etc.), but this
# is a more advanced topic.

# ------------------------------------------------------------------------------
################################################################################
###                        6. TYPES AND CLASSES                              ###
################################################################################
## @knitr types.objects

# A numeric vector of integers.
n <- seq(1, 100, by=1)

# Let's check the class and type.
class(n)
typeof(n)

# A character object.
char <- c("a", "b", "c", "d", "e", "f")
char

# Class and type.
class(char)
typeof(char)

# Let's put n in a matrix.
M <- matrix(n, nrow=10, ncol=10)

# Class/type of this object.
class(M)
# Type and mode tell us that this is a *numeric* matrix.
typeof(M)

# There are character and logical matrices too.
char
C <- matrix(char, nrow=3, ncol= 2)
C

# Class and type.
class(C)
typeof(C)

# Notice that a matrix can contain numbers but still be stored as character.
M <- matrix(c("1", "2", "3", "4"), nrow=2, ncol=2)
M
class(M)
typeof(M)

# Let's convert "char" to factor.
char
char <- as.factor(char)
char

# This means that now char is not just a collection of strings, it is a
# categorical variable in R's mind: it is a collection of numbers with character
# labels attached.

# Compare the different behavior of as.numeric(): char as character...
char <- c("a", "b", "c", "d", "e", "f")
char
# Convert to numeric
as.numeric(char)

# ...versus char as factor.
char <- c("a", "b", "c", "d", "e", "f")
char <- as.factor(char)
char
as.numeric(char)

# char is clearly a different object in R's mind when it's character vs when
# it's factor. For example, R knows characters can't be converted to numbers,
# but factors can.

# ***** EXERCISE: 
# Using rep(), create a character vector of length=10 representing a generic
# GENDER variable. The vector can only contain the strings "male" and "female".
# Create it as a character vector, then convert it to factor. Print the factor. 
# Finally, convert the factor to numeric. What is the integer number associated
# to "male"? If you create a different GENDER vector, does it remain the same
# number? What determines it?
# *****

