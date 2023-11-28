source("./ScaleMap/ScaleMap.R")
source("./ScaleMap/Selector.R")

##--INPUTS--##
scale_map_raw1 <- c("1=Dislike Extremely
2=Dislike Very Much
3=Dislike Moderately
4=Dislike Slightly
5=Neither Like Nor Dislike
6=Like Slightly
7=Like Moderately
8=Like Very Much
9=Like Extremely")

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
##--INPUTS:END--##
