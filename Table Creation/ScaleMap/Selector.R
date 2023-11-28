library(R6)

SingleSelectScaleSelector <- R6::R6Class("SingleSelectScaleSelector",
    public = list(
        initialize = function() {
            
        },

        is_scale_vector = function(scale_values) {
            is_scale_vector <- TRUE
            if (all(is.integer(scale_values)) == FALSE) {
                stop("scale_values is not an integer vector")
                is_scale_vector <- FALSE
            }
            invisible(self)
            return(is_scale_vector)
        },
        
        min_value = function(scale_values) {
            if (!self$is_scale_vector(scale_values)) {
                # TODO: propagate the errors
                stop("scale_values is not an integer vector")
            }
            invisible(self)
            return(min(scale_values))
        },
        
        max_value = function(scale_values) {
            invisible(self)
            return(max(scale_values))
        },
        
        top_2_box_low = function(scale_values) {
            if (!self$is_scale_vector(scale_values)) {
                stop("scale_values is not an integer vector")
            }
            if (length(scale_values) < 2) {
                stop("scale_values does not have at least two elements")
            }
            sorted_values <- sort(scale_values, decreasing = TRUE)
            return(sorted_values[2])
        },
        
        top_2_box_high = function(scale_values) {
            if (!self$is_scale_vector(scale_values)) {
                stop("scale_values is not an integer vector")
            }
            if (length(scale_values) < 2) {
                stop("scale_values does not have at least two elements")
            }
            return(self$max_value(scale_values))
        },
        
        bottom_2_box_low = function(scale_values) {
            return(self$min_value(scale_values))
        },
        
        bottom_2_box_high = function(scale_values) {
            sorted_values <- sort(scale_values)
            return(sorted_values[2])
        },
        
        top_3_box_low = function(scale_values) {
            if (!self$is_scale_vector(scale_values)) {
                stop("scale_values is not an integer vector")
            }
            if (length(scale_values) < 3) {
                stop("scale_values does not have at least three elements")
            }
            sorted_values <- sort(scale_values, decreasing = TRUE)
            return(sorted_values[3])
        },
        
        top_3_box_high = function(scale_values) {
            return(self$max_value(scale_values))
        },
        
        bottom_3_box_low = function(scale_values) {
            return(self$min_value(scale_values))
        },
        
        bottom_3_box_high = function(scale_values) {
            if (!self$is_scale_vector(scale_values)) {
                stop("scale_values is not an integer vector")
            }
            if (length(scale_values) < 3) {
                stop("scale_values does not have at least three elements")
            }
            sorted_values <- sort(scale_values)
            return(sorted_values[3])
        },
        
        top_4_box_low = function(scale_values) {
            if (!self$is_scale_vector(scale_values)) {
                stop("scale_values is not an integer vector")
            }
            if (length(scale_values) < 4) {
                stop("scale_values does not have at least four elements")
            }
            sorted_values <- sort(scale_values, decreasing = TRUE)
            return(sorted_values[4])
        },
        
        top_4_box_high = function(scale_values) {
            return(self$max_value(scale_values))
        },
        
        bottom_4_box_low = function(scale_values) {
            return(self$min_value(scale_values))
        },
        
        bottom_4_box_high = function(scale_values) {
            if (!self$is_scale_vector(scale_values)) {
                stop("scale_values is not an integer vector")
            }
            if (length(scale_values) < 4) {
                stop("scale_values does not have at least four elements")
            }
            sorted_values <- sort(scale_values)
            return(sorted_values[4])
        },
        
        middle_box = function(scale_values) {
            if (!self$is_scale_vector(scale_values)) {
                stop("scale_values is not an integer vector")
            }
            if (length(scale_values) < 2) {
                stop("scale_values does not have at least two elements")
            }
            sorted_values <- sort(scale_values)
            middle_index <- ceiling(length(sorted_values) / 2)
            return(sorted_values[middle_index])
        }
        
    ),
    
    private = list(
        
    )
)
