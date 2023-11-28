# WCScript: Table Structure

```raw
title: "Table Syntax"
```

This document describes and defines the syntax of WCScript (The rules that control the structure of the symbols, punctuation, and words of WCScript). WCScript is a custom language. It does not have a compiler or an interpreter, but is run by a SAAS product called WinCross which is similar to SPSS.

Caret delimiter `^`:  The caret character in WinCross is like a special symbol. It means different things depending on where it appears in table code.

Table delimiter `T1^`: `TableDelimiter^`. The `T1` in the first example is the table delimiter. 

Settings:
    - Default: "OR,OB,OS,S1,S2,O%,OI"
    - TableRanked: "OR,OB,OS,S1,S2,O%,OI,OD"

Table options

OQ = Show the Total row
OR = Show Frequencies -- Only per request
OV = Show Vertical percents
OH = Show Horizontal percents -- Only for 1 client
OB = Hide blank rows -- Only for the same 1 client
OI = Indent levels on NET and SUB rows
O% = Show percent sign on percents
F1 = Show one decimal place on frequencies -- either or F2
F2 = Show two decimal places on frequencies -- either or F1
P0 = Show no decimal places on percents -- either or P1/P2
P1 = Show one decimal place on percents -- either or P0/P2
P2 = Show two decimal places on percents -- either or P0/P1

**Rank**
OD = Rank descending
OA = Rank ascending
R% = Rank by percents/means (Default: Rank by frequencies/means)

**Statistics Options**
SB = Show Sample size for statistic base
SM = Show Mean
SV = Show Standard deviation
SR = Show Standard error
SD = Show Median

**Statistic Decimal Places**
S0 = (Central tendency) Show no decimal places on statistics (except Standard deviation and Standard error)
S1 = (Central tendency) Show one decimal place on statistics (except Standard deviation and Standard error)
S2 = (Central tendency) Show two decimal places on statistics (except Standard deviation and Standard error)
S3 = (Central tendency) Show three decimal places on statistics (except Standard deviation and Standard error)
V0 = (Variability) Show no decimal places on Standard deviation and Standard error
V1 = (Variability) Show one decimal place on Standard deviation and Standard error
V2 = (Variability) Show two decimal places on Standard deviation and Standard error
V3 = (Variability) Show three decimal places on Standard deviation and Standard error