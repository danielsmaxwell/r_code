#
# This function returns body/tail proportions for a given z-score.
#
 
z_table <- function(z = 0.00)
{
  # Validate arguments.
  if (! is.numeric(z)) {message('Argument z is not a number!'); return(NA)}
  if (z < 0 | z > 4) {message('Argument z must be between 0 and 4!'); return(NA)}
  
  # Calculate the body and then the tail.
  b <- pnorm(z)
  t <- 1 - b
  
  msg <- paste('Body:', round(b, 5), 'Tail:', round(t, 5))
  
  return(msg)
}
