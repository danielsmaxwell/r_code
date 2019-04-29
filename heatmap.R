# -----------------------------------------------------------------------
# Environment setup -- use RColorBrewer to define a custom palette, load
# the data into a temporary dataframe, and then create the palette.
#       Light yellow = absence (0)    Light blue = presence (1)
# -----------------------------------------------------------------------

library(RColorBrewer)

tmp_df <- read.csv("heatmap_data.csv", stringsAsFactors = FALSE)

my_palette <- colorRampPalette(c("lightyellow", "lightblue"))(n = 299)

# ----------------------------------------------------------------------
# The heatmap() function only accepts data as a matrix.  Thus, the next 
# three steps are necessary to get the data into a proper format.
# ----------------------------------------------------------------------

rnames  <- tmp_df[,1]                       # Create vector of row names  

x <- data.matrix(tmp_df[,2:ncol(tmp_df)])   # Create the data matrix

rownames(x) <- rnames                       # Assign row names to matrix

# ----------------------------------------------------------------------
# Generate the heatmap. Note: the NA values passed to Colv and Rowv turn 
# off the row and column dendograms.
# ----------------------------------------------------------------------

heatmap(x,                                 
        Colv  = NA,
        Rowv  = NA,
        scale = 'none', 
          col = my_palette,
         xlab = 'E-Coli Strains',
         ylab = 'Virulence Factors')
