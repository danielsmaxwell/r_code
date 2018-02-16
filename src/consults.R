# ------------------------------------------------
# Andreina Kostantinov's linguistic t-tests.
# ------------------------------------------------

tl <- read.delim('kostantinov_text_lengths.txt',header = TRUE, stringsAsFactors = FALSE)

orig <- subset(tl, tl$TEXTSOURCE == 'Original')
tran <- subset(tl, tl$TEXTSOURCE == 'Translation')

# Calculate the mean and standard deviation for both groups.
mean(orig$LENGTH)
mean(tran$LENGTH)

sd(orig$LENGTH)
sd(tran$LENGTH)

# The two-sample t-test.
t.test(tran$LENGTH, orig$LENGTH, alternative = 'greater')

t.test(orig$LENGTH, tran$LENGTH, alternative = 'greater')

# The paired t-test.
t.test(tran$LENGTH, orig$LENGTH, alternative = 'greater', paired = TRUE)

t.test(tran$LENGTH, orig$LENGTH, alternative = 'greater', paired = TRUE)

# Use the ifelse() function to create a column and populate it with values
# depending on what is in the L1 column.

df_2 <- read.delim('kostantinov_bilinguals.txt',header = TRUE, stringsAsFactors = FALSE)

df_2$lang_class <- ifelse(df_2$L1 == 'English', 'monolingual','bilingual')


# ------------------------------------------------
# Steven Longmire's ggplot2() conundrum.
# ------------------------------------------------

library(ggplot2)

wq <- read.csv("longmire_water.csv", header = TRUE, stringsAsFactors = FALSE)

# -----------------------------------------------------------------------------------
# The underlying problem is that the data is presented in 'wide' as opposed to 'long'
# format.  Thus we need to peel off each column of interest and stack them, one on top
# of the other.  Base R provides the stack() function to do this, but that does not
# work here because of the desire to plot new_date on the x-axis.  Adding a 3rd column
# to the stack() function creates a data mess.
# -----------------------------------------------------------------------------------

tp  <- data.frame('tp', wq$tp, wq$new_date)
tn  <- data.frame('tn', wq$tn, wq$new_date)
chl <- data.frame('chl', wq$chl, wq$new_date)

# Set column names so they match.
colnames(tp)  <- c('Measure','value','date')
colnames(tn)  <- c('Measure','value','date')
colnames(chl) <- c('Measure','value','date')

df <- rbind(tp, tn, chl)

# Update theme so the plot title will be centered.
theme_update(plot.title = element_text(hjust = 0.5))  

ggplot(df, aes(date, value, colour = Measure)) +
  geom_point() +
  geom_line(aes(group = Measure)) +
  ggtitle('Station 1')

# Reset theme to its default values.
theme_set(theme_gray())

# ------------------------------------------------
# Natalie Ridgewell's education research data.
# ------------------------------------------------

x <- read.csv("ridgewell_age_race.csv", as.is = TRUE)

table(x$race)

black <- x[grep("*Black*", x$race), ]
asian <- x[grep("*Asian*", x$race), ]

hist(black$age, 
     breaks = 30, 
     xlim   = range(0:80), 
     ylim   = range(0:100),
     col    = "lightblue",
     xlab   = "Age",
     main   = "Age Distribution (Black) \n n = 757",
     las    = 1)

hist(asian$age, 
     breaks = 30, 
     xlim   = range(0:80), 
     ylim   = range(0:15),
     col    = "lightblue",
     xlab   = "Age",
     main   = "Age Distribution (Asian) \n n = 104",
     las    = 1)

# --------------------------------------------------------------------
# Code to calculate age from the birth_date column.  I calculated ages
# this way because R's as.Date function simply refused to work on the
# birth_date column, making date arithmetic impossible.  I also tried
# to use strsplit() to slice the birth_date column into its respective 
# parts but this strategy failed as well.
# --------------------------------------------------------------------

y <- x[, c("birth_date","race")]

y$birth_year <- substr(y$birth_date, nchar(y$birth_date) - 3, nchar(y$birth_date)) 
y$age <- 2017 - as.numeric(y$birth_year)


# ------------------------------------------------
# Analysis of Aghane Antunes research data
# ------------------------------------------------

x <- read.csv("antunes_rainforest.csv", as.is = TRUE)

member     <- x[x$membership == 1,]
not_member <- x[x$membership == 0, ]

# Here we discover that our variances are not equivalent.  Thus, a
# key assumption for parametric tests does not hold.
var.test(member$ntfp, not_member$ntfp)

var(member$ntfp)
var(not_member$ntfp)

# Can we convert the data to achieve equivalent variances?
# A log conversion of the data points fails...
var(log(member$ntfp))
var(log(not_member$ntfp))

var.test(log(member$ntfp), log(not_member$ntfp))

# Let's try the square root... this fails as well.
var(sqrt(member$ntfp))
var(sqrt(not_member$ntfp))

var.test(sqrt(member$ntfp), sqrt(not_member$ntfp))

# Okay, does the assumption of a normal distribution hold?
hist(member$ntfp, breaks = 30, col = "tan")
hist(not_member$ntfp, breaks = 30, col = "tan")

# Looks like we have skewed distributions but let's generate
# qqplots to compare against a normal t distribution.
qqplot(member$ntfp, rt(221, df = 220))
qqplot(not_member$ntfp, rt(190, df = 189))

# Run the t-test just to see what it returns.
t.test(x = member$ntfp, y = not_member$ntfp, alternative = "two.sided")

# ----------------------------------------------------
# Linear Regression Models
# ----------------------------------------------------

df <- read.csv("antunes_rainforest.csv", as.is = TRUE)

# ------------------------------------------------------------
# NTFP : Significant
# ------------------------------------------------------------
x <- df[, c("ntfp","palmito","total")]
x$n_tot <- x$ntfp + x$palmito

nt <- x                             # Take all of the rows.
nt <- x[x$n_tot > 0,]               # Take only rows with values.
fit1 <- lm(nt$total ~ nt$n_tot)     

plot(nt$n_tot, nt$total)
abline(fit1, col = "red")
abline(h = 50000, col = "blue")

res <- residuals(fit)

# -----------------------------------------------------------
# Fish Model : Non-Significant
# -----------------------------------------------------------
fish <- df[, c("fishing", "shrimp", "crab", "defeso","total")]
fish$ftotal <- fish$fishing + fish$shrimp + fish$crab + fish$defeso

f <- fish[fish$ftotal > 0,]  
fit3 <- lm(f$total ~ f$ftotal)

plot(f$ftotal, f$total)
abline(fit3, col = "red")

# ------------------------------------------------------------
# Timber model : Significant
# ------------------------------------------------------------
x <- df[, c("wood","sawmill","total")]
x$t_tot <- x$wood + x$sawmill

timber <- x[x$t_tot > 0,]
fit4 <- lm(timber$total ~ timber$t_tot)

plot(timber$t_tot, timber$total)
abline(fit4, col = "red")
abline(h = 30000, col = "blue")

# ------------------------------------------------------------
# Govt model : Significant
# ------------------------------------------------------------
x <- df[, c("bfamilia","pension","total")]
x$g_tot <- x$bfamilia + x$pension

govt <- x[x$g_tot > 0,]
fit5 <- lm(govt$total ~ govt$g_tot)

plot(govt$g_tot, govt$total)
abline(fit5, col = "red")

# ------------------------------------------------------------
# Livestock model : Non-Significant
# ------------------------------------------------------------
x <- df[, c("chicken","total")]

live <- x[x$chicken > 0,]
fit6 <- lm(live$total ~ live$chicken)

plot(live$chicken, live$total)
abline(fit6, col = "red")

# ------------------------------------------------------------
# Agriculture model : Highly-Significant
# ------------------------------------------------------------
x <- df[, c("agriculture","pepper","farinha","passionf","cocoa","bverde","cupuacu","total")]
x$a_tot <- x$agriculture + x$pepper + x$farinha + x$passionf + x$cocoa + x$cupuacu + x$bverde

ag <- x[x$a_tot > 0,]
fit7 <- lm(ag$total ~ ag$a_tot)

plot(ag$a_tot, ag$total)
abline(fit7, col = "red")

# ------------------------------------------------
# Larry Winner code
# ------------------------------------------------

rr.mar <- read.csv("http://www.stat.ufl.edu/~winner/data/rocknroll_marathon_mf2015a.csv",
                   header=T)

attach(rr.mar) 

names(rr.mar)

tapply(mph, Gender,mean)

tapply(mph, Gender,sd)

plot(Gender, mph)

# What kind of graph do we get if gender is binary rather than
# categorical?  First, we'll detach the dataframe in order to
# add a new column.  Then we'll set a new column to 0 if Female
# and 1 if male.  Reattach the dataframe and plot.

detach(rr.mar)  

rr.mar$MaleFemale <- ifelse(rr.mar$Gender == 'F', 0, 1)

attach(rr.mar)

plot(MaleFemale, mph)     # Plot the graph again...

