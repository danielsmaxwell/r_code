
library ("RSQLite")

con <- dbConnect(drv = SQLite(), dbname = "don_blackbear_gradres.db")
con <- dbConnect(drv = SQLite(), dbname = "c:/informatics/don_blackbear_gradres.db")

tst <- dbGetQuery(con, 'select * from sqlite_master;')

tst <- dbGetQuery(con, 'select count(*) from bear_hyperphagia_2hr')

all_rows <- dbGetQuery(con, 'select * from bear_hyperphagia_2hr')

all_tables <- dbListTables(con)

all_tables

nbiome <- dbGetQuery(con, 'select * from natural_microbiome')

nrow(nbiome)

dbDisconnect(con)
