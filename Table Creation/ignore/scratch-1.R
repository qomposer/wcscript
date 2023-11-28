source("./ScaleMap/ScaleMap.R")
source("./ScaleMap/Selector.R")


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

scale_maps_collection <- list(scaleMap1, scaleMap2, scaleMap3)
scale_maps_collection

scaleValueSelector <- SingleSelectScaleSelector$new()
scaleValueSelector

# Suitable for retrieving the top 2 box high values as a 1 element vector
for (i in seq( length(scale_maps_collection) )) {
    # Get the scale map per question
    indiv_scale_map <- scale_maps_collection[[i]]

    # Get the scales as integers then
    # Get the top 2 box high value
    top_2_box_high_per_q <- indiv_scale_map$get_scale_value_int() |> 
        scaleValueSelector$top_2_box_high()
    
    print(top_2_box_high_per_q)
}

select_value_collection <- function(scale_maps_collection, box_value = "T2B") {

}


tab_instruction_t2b <- "T2B"
tab_instruction_54 <- "1/2/3/4/5"
tab_instruction_t2b <- "Top 2 Box"

caret <- function() { "^" }
parens_left <- function() { "(" }
parens_right <- function() { ")" }

wrap_carat_parens <- function(scale_value) {
    glue::glue(caret(), parens_left(), scale_value, parens_right(), caret())
}

scale_map_raw1 |> sapply(FUN=wrap_carat_parens)

# Table type
table_type <- "Long"

# Instruction
table_instruction <- "Full,Mean,T3B,T2B,B2B"

# Question title
question_title <- "Overall Opinion"

# WCS variable
wcs_var <- "Q1_1"

# Question variable
data_var <- "Q1"

# Scale map
scale_map_raw1 <- c("1=Dislike Extremely
2=Dislike Very Much
3=Dislike Moderately
4=Dislike Slightly
5=Neither Like Nor Dislike
6=Like Slightly
7=Like Moderately
8=Like Very Much
9=Like Extremely")
# First value from instruction (determines which scale or row value will have the data variable prepended (if single-select/grid else each data variable for multi-select))

# Table Type: Long / Short

 ^ ^
 Q1. Overall Liking
 Like Extremely^Q1_1(9)^
 Like Very Much^(8)^
 Like Moderately^(7)^
 Like Slightly^(6)^
 Neither Like Nor Dislike^(5)^
 Dislike Slightly^(4)^
 Dislike Moderately^(3)^
 Dislike Very Much^(2)^
 Dislike Extremely^(1)^
 Mean^(1-9)^SM
 Top 3 Box ^(7-9)^
 Top 2 Box ^(8-9)^
 Bottom 2 Box^(1-2)^
 ^ ^

