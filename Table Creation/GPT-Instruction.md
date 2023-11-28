---
title: "GPT Prompt"
---
## What is WCScript

WCScript is a domain specific language that is used to generate cross-tables for consumer market research studies. Tables are generated out of the survey questions programmatically. 

## What is the current objective

Study the output below. Describe what how the syntax looks to you based on the inputs and the output.
Come up with variable names for each piece of the syntax of the WCScript code (which R will be used to generate).
We are writing an R package to generate this code but we are not complete. You will help us complete the code to create the desired output.

OUTPUT:
```
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
```

