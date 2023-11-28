suppressWarnings(suppressMessages({
    library(stringr);
    library(magrittr);
    library(tibble);
    library(purrr);
}))

# The scale map is a collection of scales and values
# This example is a 9-point Likert rating scale
attribute_value_map <- c("1=Dislike Extremely
2=Dislike Very Much
3=Dislike Moderately
4=Dislike Slightly
5=Neither Like Nor Dislike
6=Like Slightly
7=Like Moderately
8=Like Very Much
9=Like Extremely")

# Splits on newline. str_split returns a list containing a string vector.
# unlist() extracts the vector.
flat_scale_map <- stringr::str_split(attribute_value_map, "\n") |> unlist() |> stringr::str_split("=")
flat_scale_map

scale_map_split <- stringr::str_split(attribute_value_map, "\n") |> unlist() |> stringr::str_split("=")
scale_map_split

# Vectors of scales
scale_value <- sapply(scale_map_split, `[`, 1) |> as.integer()

scale_string <- sapply(scale_map_split, `[`, 1)

scale_label <- sapply(scale_map_split, `[`, 2) |> stringr::str_trim()

scale_tibble <- tibble::tibble(
    scale_value = scale_value,
    scale_string = scale_string,
    scale_label = scale_label
)

subset_tibble <- function(tibble, column_name) {
  # Check if column_name exists in the tibble
  if (!(as.character(quote(column_name)) %in% names(tibble))) {
    stop(paste("Column", column_name, "not found in the tibble"))
  }
  
  # Subset the tibble
  subset_tibble <- tibble[, as.character(column_name), drop = FALSE]
  
  return(subset_tibble)
}
names(scale_tibble)

quote(scale_value)

scale_tibble %>% subset_tibble(., scale_value)
