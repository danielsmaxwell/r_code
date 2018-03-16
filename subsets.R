# -------------------------------------------------------------------
# The SQL approach to subsetting...
# -------------------------------------------------------------------

library ("RSQLite")

con <- dbConnect(drv = SQLite(), dbname = "don_blackbear_gradres.db")

# With SQL, we simply query the database directly.  Alternatively, we could create
# a view in the database, thereby reducing the amount of code passed to the db engine.
df <- dbGetQuery(con, "select age, weight from participant where participant_id in ('F600','F601')")

# ------------------------------------------------------------------
# The base R approach to subsetting...
# ------------------------------------------------------------------

df <- dbGetQuery(con, "select * from participant")

# We can use the base R subset() function to create the subset.
bear <- subset(df, participant_id == 'F600' | participant_id == 'F601',
               select = c(age, weight, body_length_cm, body_condition, cubs))

# Or we can use R indexes to accomplish the same result.
bear <- df[df$participant_id == 'F600' | df$participant_id == 'F601',
           c("age","weight","body_length_cm","body_condition","cubs")]

# ------------------------------------------------------------------
# The dplyr approach to subsetting...  
# ------------------------------------------------------------------

library(dplyr)

df <- dbGetQuery(con, "select * from participant")

# We can use the dplyr functions independently, using df2 as an intermediate
# dataframe to hold filtered results.
df2  <- filter(df, participant_id == 'F600' | participant_id == 'F601')
bear <- select(df2, age, weight, body_length_cm, body_condition, cubs)

# Or we can use the pipe operator to accomplish everything in one fell swoop.
bear <- filter(df, participant_id == 'F600' | participant_id == 'F601') %>%
  select(age, weight, body_length_cm, body_condition, cubs)


