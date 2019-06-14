# Package dependencies for the functions in this file.

.onload <- function(libname, pkgname){
  require(getPass)
  require(DBI)
  require(RMySQL)
}

# -------------------------------------------------------
#' @title get_data_med05
#' @details This function retrieves the manudatamed05 data set.  
#' 
#' @export
#' @return data_frame
#' @keywords manumed05
#' @author Dan Maxwell
# -------------------------------------------------------

get_data_med05 <- function(){

  data_frame <- read.csv("manuscript.csv", as.is = TRUE, header = TRUE)
  data_frame$Variables <- paste(data_frame$KGID,data_frame$variable,"")
  
  return(data_frame)
}
  
# -------------------------------------------------------
#' @title connect_mysql
#' @details This function prompts for a user password and then connects to the
#'          specified MySQL instance, using the passed arguments.
#' @export
#' @return cxn
#' @keywords mysql connection connect
#' @author Dan Maxwell
# -------------------------------------------------------

connect_mysql <- function(user, host, dbname){

  passwd <- getPass(msg = "MySQL Password: ")
  
  cxn <- dbConnect (RMySQL::MySQL(), 
                    user     = user, 
                    password = passwd, 
                    host     = host, 
                    dbname   = dbname)
   
  return(cxn)
}
