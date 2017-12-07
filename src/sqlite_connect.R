#
# This code demonstrates how to connect to a SQLite database -- in this case the
# microbiome.db -- execute a simple select statement, and then close the connection.
#

library ("RSQLite")

con <- dbConnect(drv = SQLite(), dbname = "microbiome.db")

all_tables <- dbListTables(con)

all_tables

nbiome <- dbGetQuery(con, 'select * from natural_microbiome')

nrow(nbiome)

dbDisconnect(con)
