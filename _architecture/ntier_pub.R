# -------------------------------------------------------
#' @title Script: ntier_pub
#' @details This script demonstrates how the publication layer interacts
#'          with the visualization and data transformtion layers.  This 
#'          script eventually become a R Markdown document. 
#' 
#' @author Dan Maxwell
# -------------------------------------------------------

# Setup the working environment.

library(ggplot2)

setwd("c:/informatics/nutrition") 

# Get the data for the plot.

data_frame <- get_data_med05()

# Generate the plot (Figure X)

p <- ggplot(data_frame, aes(x = DOPKT, y = value, color = Variables, group = Variables)) +
        geom_hline(yintercept = 100, size = 1) +
        geom_line() +
        geom_point(aes(shape = Variables, fill = Variables), size = 2) +
        labs(x = "Month on Therapy", y = "Score (%)", angle = 0, size = 10)

# Add the scale and basic themes to the plot, aka the bling.

l <- c("KG0129 MFS", "KG0129 MS", "KG0174 MFS", "KG0174 MS")

p <- add_theme_scale(plt = p, lbls = l)
p <- add_theme_basic(plt = p)
p

p <- NULL
