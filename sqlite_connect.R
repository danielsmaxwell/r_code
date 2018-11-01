#
# This code demonstrates how to connect to a SQLite database -- in this case the
# don_blackbear_gradres.db -- execute a simple select statement, and then close the 
# connection.
#

library ("RSQLite")

#
# The dbConnect function is peculiar in that it creates an empty database for
# you if it does not find one at the specified location.  This function, in other 
# words, never throws an error.  If you don't specify a full path for the dbname 
# parameter, dbConnect appends the working directory path.  Use getwd() to query
# this value.  You can also display the contents of con to see the database file
# that dbConnect either opened or created.  
#
# If you run a SELECT statement against a newly created database, dbGetQuery throws 
# an error, indicating that the table or view does not exist.  When this happens, 
# take a look at the location of the database file in the con object.  Best practice
# here is to specify the full pathname to the database file in the dbname argument.
#

# Connect to the database.
con <- dbConnect(drv = SQLite(), dbname = "c:/informatics/don_blackbear_gradres.db")
con

# List all of the tables in the database.
all_tables <- dbListTables(con)
all_tables

# Run a count query.
row_cnt <- dbGetQuery(con, 'select count(*) from bear_hyperphagia_2hr')
row_cnt

# Another way of determining how many objects are in the database.
obj_cnt <- dbGetQuery(con, 'select * from sqlite_master')
obj_cnt

dbDisconnect(con)
