library(R6)

ScaleMap <- R6::R6Class("ScaleMap",
    public = list(
        initialize = function(scale_map_raw = "", debug_print = FALSE) {
            self$set_log(debug_print)
            self$split_initial(scale_map_raw)
        },
        
        split_initial = function(scale_map_raw) {
            if (!(is.character(scale_map_raw))) {
                stop("Scale map must be a string")
            }
            if (stringr::str_detect(scale_map_raw, "^$")) {
                stop("scale_map_raw is empty")
            }
            split_raw_scale_map <- stringr::str_split(scale_map_raw, "\n") |>
                # str_split returns a list. We want a vector.
                unlist() |> stringr::str_split("=")
            
            # Get the values as integer
            scale_value_int <- split_raw_scale_map |> 
                # Subsets each character vector in the list
                sapply(FUN=`[`, 1) |> stringr::str_trim() |> # Then remove whitespace
                as.integer() # Then convert to an integer
            
            if (private$log_on == TRUE) {
                print(glue::glue("scale value int: {scale_value_int}"))
            }
            
            # Get the values as strings
            scale_value_string <- split_raw_scale_map |>
                sapply(FUN=`[`, 1) |> stringr::str_trim() |> 
                as.character()
            
            if (private$log_on == TRUE) {            
                print(glue::glue("scale value string: {scale_value_int}"))
            }
            
            # Get the labels
            scale_value_label <- split_raw_scale_map |>
                sapply(FUN=`[`, 2) |> stringr::str_trim()
            
            if (private$log_on == TRUE) {
                print(glue::glue("scale value label: {scale_value_label}"))
            }
            
            private$scale_value_int <- scale_value_int
            private$scale_value_string <- scale_value_string
            private$scale_value_label <- scale_value_label
            
            invisible(self)
        },
        
        # Toggles logging
        set_log = function(log = FALSE) {
            if (log == FALSE & private$log_on == TRUE) {
                private$log_on <- log
            } else if (log == TRUE & private$log_on == FALSE) {
                private$log_on <- log
            }
            invisible(self)
            return(NULL)
        },
        
        get_scale_value_int = function() { private$scale_value_int },
        get_scale_value_string = function() { private$scale_value_string },
        get_scale_value_label = function () { private$scale_value_label }
        # public
    ),
    
    private = list(
        scale_value_int = "",
        scale_value_string = "",
        scale_value_label = "",
        log_on = FALSE
        # private
    )
)
