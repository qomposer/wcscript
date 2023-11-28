# R6 Classes & Test Driven R Development
library(R6)
library(stringr)
library(purrr)

# Inputs

# Scale map
scale_map_raw <- c("1=Dislike Extremely
2=Dislike Very Much
3=Dislike Moderately
4=Dislike Slightly
5=Neither Like Nor Dislike
6=Like Slightly
7=Like Moderately
8=Like Very Much
9=Like Extremely")

table_instruction <- "Full,Mean,T3B,T2B,TB,B2B,B3B"

# `clean_table_instruction()`
clean_table_instruction <- function(table_instruction) {
    # Extract each instruction
    cleaned_table_instruction <- stringr::str_split(table_instruction, fixed(",")) |> 
        # str_split returns a list. We want a vector.
        unlist() |> 
        # Remove any whitespace surrounding each instruction.
        stringr::str_trim()
    
    return(cleaned_table_instruction)
}

table_instruction |> clean_table_instruction()

TableInstruction <- R6::R6Class("TableInstruction",
                                public = list(
                                    initialize = function() { },
                                    set_table_instruction = function(table_instruction) {
                                        private$raw_instruction <- table_instruction
                                    },
                                    get_table_instruction = function() {
                                        return(private$raw_instruction)
                                    }
                                ),
                                private = list(
                                    raw_instruction = ""
                                )
)

tableInstruction <- TableInstruction$new()
tableInstruction$set_table_instruction(table_instruction)
tableInstruction$get_table_instruction()


TableInstructionFull <- R6::R6Class("TableInstructionFull",
                                    public = list(
                                        initialize = function() {
                                            
                                        }
                                    ),
                                    private = list(
                                        scale_value_string = ""
                                    )
)

carat <- function() { "^" }
parens_open <- function() { "(" }
parens_close <- function() { ")" }


make_full <- function(scale_value_string, data_variable = "") {
    this_scale_value_string <- as.character(scale_value_string);
    this_scale_value_string <- sort(this_scale_value_string, decreasing = TRUE)
    output_string <- character(length = 0L) #character(length = as.integer(length(this_scale_value_string)));
    if (stringr::str_detect(data_variable, "^$") == TRUE) {
        for (scale_value_str in this_scale_value_string) {
            out_str <- glue::glue(carat(), parens_open(), scale_value_str, parens_close(), carat());
            output_string <- append(out_str, output_string);
        }
    } else {
        for (i in seq_along(this_scale_value_string)) {
            if (i == 1) {
                out_str <- glue::glue(carat(), data_variable, parens_open(), this_scale_value_string[i], parens_close(), carat());
                output_string <- append(out_str, output_string);
            } else {
                out_str <- glue::glue(carat(), parens_open(), this_scale_value_string[i], parens_close(), carat());
                output_string <- append(out_str, output_string);
            }
        }
    }
    return(output_string);
}


#table_enum <- c("Full" = 1, "Mean" = 2, "T3B" = 3, "T2B" = 4, "TB" = 5, "B2B" = 6, "B3B" = 7)
#class(table_enum) <- "BoxEnum"
#mode(table_enum)
#
#table_enum
#
#scale_map_split_string <- scale_map_raw |>
#    stringr::str_split("\n") |> unlist() |>
#    stringr::str_split("=")
#scale_map_split_string
#
#scale_map_split_string |>
#    sapply(FUN=`[`, 1) |>
#    stringr::str_trim() |>
#    as.integer()
#
#scale_map_split_string |>
#    sapply(FUN=`[`, 1)
#
#scale_map_list <- scale_map_raw |>
#    stringr::str_split("\n") |> unlist() |>
#    stringr::str_split("=") 
#
#scale_map_list
#
#table_length_type <- c("Long" = 1, "Short" = 2)

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


# Scale map
scale_map_raw <- c("1=Dislike Extremely
2=Dislike Very Much
3=Dislike Moderately
4=Dislike Slightly
5=Neither Like Nor Dislike
6=Like Slightly
7=Like Moderately
8=Like Very Much
9=Like Extremely")

scaleMap <- ScaleMap$new(scale_map_raw=scale_map_raw, debug_print=FALSE)
scaleMap$split_initial(scale_map_raw)
print(scaleMap$get_scale_value_int())
print(scaleMap$get_scale_value_string())
print(scaleMap$get_scale_value_label())


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

scale_map_raw1 <- c("1=Dislike Extremely
2=Dislike Very Much
3=Dislike Moderately
4=Dislike Slightly
5=Neither Like Nor Dislike
6=Like Slightly
7=Like Moderately
8=Like Very Much
9=Like Extremely")

scale_map_raw2 <- c("1=Dislike Extremely
2=Dislike Very Much
3=Dislike Moderately
4=Dislike Slightly
5=Neither Like Nor Dislike
6=Like Slightly
7=Like Moderately
8=Like Very Much
9=Like Extremely")

scale_map_raw3 <- c("1=Definitely Would Not Buy
2=Would Not Buy
3=Might Buy
4=Would Buy
5=Definitely Would Buy")

scaleMap1 <- ScaleMap$new(scale_map_raw1)
scaleMap2 <- ScaleMap$new(scale_map_raw2)
scaleMap3 <- ScaleMap$new(scale_map_raw3)

scale_maps_list <- list(scaleMap1, scaleMap2, scaleMap3)
scale_maps_str <- c(scaleMap1, scaleMap2, scaleMap3)
scale_maps_list

scaleValueSelector <- SingleSelectScaleSelector$new()

# Suitable for retrieving the top 2 box high values as a 1 element vector
for (i in seq(length(scale_maps_str))) {
    indiv_scale_map <- scale_maps_str[[i]]
    top_2_box_high_per_q <- indiv_scale_map$get_scale_value_int() |> 
        scaleValueSelector$top_2_box_high()
    print(top_2_box_high_per_q)
}

# Returns a list of top 2 box high values
top_2_box_high_per_q <- map(scale_maps_str, ~ .x$get_scale_value_int() %>% 
                                scaleValueSelector$top_2_box_high())

print(top_2_box_high_per_q)

scaleMap2$get_scale_value_int() |> scaleValueSelector$bottom_4_box_high()

make_full(scaleMap3$get_scale_value_string(), data_variable = "Q1_1")