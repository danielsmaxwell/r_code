#' t table function
#'
#' This function returns t values for a given alpha level, degree of freedom, and one/two tails.
#' @param numeric input alpha, degrees of freedom and either 1 or 2 tails
#' @keywords t table t-test
#' @export
#' @examples
#' t_table(alpha = .05, df = 3, tail = 1)

t_table <- function(alpha = .05, df = 1, tail = 1)
{
  # Validate arguments.
  if (! is.numeric(alpha)) {message('Argument alpha is not a number!'); return(NA)}
  if (! is.numeric(tail)) {message('Argument tail is not a number!'); return(NA)}
  if (! is.numeric(df)) {message('Argument df is not a number!'); return(NA)}
  
  if (tail < 1 | tail > 2) {message('Argument tail must be 1 or 2!'); return(NA)}

  # Initialize t.
  t <- NA
  
  # Calculate t for one tail.
  if (tail == 1) {
    t <- qt(1 - alpha, df)
  }
  
  # Calculate t for two tails.
  if (tail == 2) {
    t <- qt(1 - alpha/2, df)
  }
 
  return(t)
}
