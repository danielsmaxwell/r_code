# ------------------------------------------------
# Analysis of Natalie Ridgewell's research data.
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

nt <- x[x$n_tot > 0,]
fit1 <- lm(nt$total ~ nt$n_tot)

plot(nt$n_tot, nt$total)
abline(fit7, col = "red")
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

