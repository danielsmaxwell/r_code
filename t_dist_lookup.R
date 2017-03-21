#
# Function t_dist_lookup calculates the values of t corresponding
# to proportions in one tail or in two tails combined.  In other 
# words, this function automates the task of looking up t values in 
# a published t distribution table (Gravetter, 2016, p. 651). 
#

t_dist_lookup <- function(deg_free, proportion, tail_cnt)
{
  if (tail_cnt == 1)
  {
    left_side <- 0
    right_side <- 1 - proportion
    qt (right_side, df = deg_free) 
  }
  else if (tail_cnt == 2)
  {
    left_side <- proportion / 2
    right_side <- 1 - left_side
    qt (c (left_side, right_side), df = deg_free)
  }
  else
  {
    message ("Parameter tail_cnt must be 1 or 2!")
    return()
  }
}