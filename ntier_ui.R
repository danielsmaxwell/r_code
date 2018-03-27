# -------------------------------------------------------
#' @title add_theme_basic
#' @details This function adds the basic theme to a ggplot object.  
#' 
#' @export
#' @param plt a ggplot2 object
#' @return plt
#' @keywords basic theme
#' @author Daniel Maxwell
# -------------------------------------------------------

add_theme_basic <- function(plt){
  
  cl <- class(plt)
  
  if (cl[1] != "gg") {stop("plt is not a ggplot object!")}  # Validate plt argument. 
  
  plt <- plt + theme(panel.border     = element_rect(colour = "black", fill = NA, size = 1.5),
                     panel.background = element_rect(fill = "white"), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(),
                     text             = element_text(size = 30), 
                     axis.title       = element_text(angle = 0, size = 30),
                     axis.text.x      = element_text(angle = 0),
                     legend.position  = c(0.15, 0.9), 
                     legend.text      = element_text(size = 15), 
                     legend.title     = element_blank())
  
  return(plt)
  
} # add_theme_basic()

# -------------------------------------------------------
#' @title add_theme_scale
#' @details This function adds the scale theme to a ggplot object. 
#' 
#' @export 
#' @param plt a ggplot2 object
#' @param lbls a vector of labels
#' @param opt a string with value of 'all', 'lbl', or 'xy'
#' @return plt
#' @keywords scale theme
#' @author Daniel Maxwell
# -------------------------------------------------------

add_theme_scale <- function(plt, lbls, opt = 'all'){

  cl <- class(plt)
  
  if (cl[1] != "gg") {stop("plt is not a ggplot object!")}  # Validate plt argument.
  
  if (opt == 'lbl' | opt == 'all'){
    plt <- plt + scale_color_manual(labels = lbls, values = c("black","black","black","black"))
    plt <- plt + scale_shape_manual(labels = lbls, values = c(21,21,24,24)) 
    plt <- plt + scale_fill_manual (labels = lbls, values = c("gray","black","gray","black")) 
  }

  if (opt == 'xy' | opt == 'all') {
    plt <- plt + scale_x_continuous(limits = c(0, 100), breaks = seq(0, 100, length.out = 5)) 
    plt <- plt + scale_y_continuous(limits = c(0, 150), breaks = seq(0, 150, length.out = 4))
  }

  return(plt)
  
} # add_theme_scale()