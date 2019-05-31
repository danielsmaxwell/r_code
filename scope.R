# Create a function that uses the global assignment operator to change a variable's value outside of its scope.

set_var <- function() {
  a_var <<- 25 
}

# Assign a value to a test variable
a_var <- 30

# Call the set_var() function...
set_var()

# ... and set_var() changes the global variable's value.
a_var
