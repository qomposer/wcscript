# WCScript: Table Structure

```raw
title: "Table formatting"
```

WinCross Script (WCScript) has both rigid and flexible rules around the structure of tables in a `.job` file.

## Spacing

Let's use WCScript-Pseudocode to illustrate apsects of spacing in a WCScript `.job` file.

```WCScript
T1^
 OR,OB,OS,S1,S2,O%,OI
 Product
 Total ^TN^0
 ^ ^
 Q1. Overall Liking
 T3B ^Q1_1(8-10)^
 T2B ^(9-10)^
 Like Extremely ^(10)^
 9- ^(9)^
 8- ^(8)^
 7- ^(7)^
 6- ^(6)^
 5- ^(5)^
 4- ^(4)^
 3- ^(3)^
 2- ^(2)^
 Dislike Extremely ^(1)^
 ^ ^
```

[Block 1: "Tight" formatting bewteen the attribute and the variable-value reference.]

In Block 1, the attribute `8-` *has one space* between it and its value reference `^(8)^`.

```WCScript
T1^
 OR,OB,OS,S1,S2,O%,OI
 Product
 Total ^TN^0
 ^ ^
 Q1. Overall Liking
 T3B               ^Q1_1(8-10)^
 T2B               ^(9-10)^
 Like Extremely    ^(10)^
 9-                ^(9)^
 8-                ^(8)^
 7-                ^(7)^
 6-                ^(6)^
 5-                ^(5)^
 4-                ^(4)^
 3-                ^(3)^
 2-                ^(2)^
 Dislike Extremely ^(1)^
 ^ ^
```

[Block 2: "Neat" formatting bewteen the attribute and the variable-value reference.]

In Block 2, a required number of spaces are added after the attribute for the value references to be aligned.
