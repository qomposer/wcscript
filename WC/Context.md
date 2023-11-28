# WCScript: Language Specifications

<TableIndex>

^ - Delimiter

<TableIndex>^
 <Settings>
 <Title>
 <Base Size>
 <Table format>

<TableIndex>^
 <Settings>
 <Section_Title>
 <Base_Size>
 <Table_Format>



WCScript has two table format styles: long format and short format.

Short format:

```WCScript
T1^
 OR,OB,OS,S1,S2,O%,OI
 Q1. Overall Liking
 Total ^TN^0
 T3B ^Q1_1(8-10)^
 T2B ^(9-10)^
 Like Extremely ^(10)^
 9 ^(9)^
 8 ^(8)^
 7 ^(7)^
 6 ^(6)^
 5 ^(5)^
 4 ^(4)^
 3 ^(3)^
 2 ^(2)^
 Dislike Extremely ^(1)^
```

**Long format example output:**

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
 9 ^(9)^
 8 ^(8)^
 7 ^(7)^
 6 ^(6)^
 5 ^(5)^
 4 ^(4)^
 3 ^(3)^
 2 ^(2)^
 Dislike Extremely ^(1)^
```

**Table Abstraction:**

```Text
 ^ ^
<TableIndex>^
 <Settings>
 <Section_Title>
 <Base_Size>
    "Total^TN^0"
    "Base: [BaseText] ^BaseVar(BaseScaleValue|BaseScaleRange)^
 ^ ^
 <QuestionNumber>. <QuestionTitle>
 <TableFormat: Full> ^<DataVar(FULLRANGE)>^
    <TableFormat::Full::ScaleMaxLabel> ^DataVar(ScaleMaxValue)^
    <TableFormat::Full::ScaleMaxLabelMin1> ^(ScaleMaxValue-1)^
    <TableFormat::Full::ScaleMaxLabelMin2> ^(ScaleMaxValue-2)^
    <TableFormat::Full::ScaleMaxLabelMin3> ^(ScaleMaxValue-3)^
        ...
    <TableFormat: ScaleMinLabel> ^(ScaleMinValue)^
 <TableFormat: Mean> ^<(ScaleValueLow-ScaleValueHigh)>^SM
 <TableFormat: Top3Box> ^([ScaleMaxValue-2]-ScaleMaxValue)^
 <TableFormat: Top2Box> ^([ScaleValueHigh-1]-ScaleValueHigh)^
 <TableFormat: Bottom2Box> ^(ScaleValueLow-[ScaleValueLow+1])^
 ^ ^
```

**Raw Output:**

```WCScript
T1^
 OR,OB,OS,S1,S2,O%,OI
 Product
 Total ^TN^0
 ^ ^
 Q1. Overall Liking
 Like Extremely ^Q1_1(10)^
 9 ^(9)^
 8 ^(8)^
 7 ^(7)^
 6 ^(6)^
 5 ^(5)^
 4 ^(4)^
 3 ^(3)^
 2 ^(2)^
 Dislike Extremely ^(1)^
 Mean ^(1-10)^SM
 Top 3 Box ^(8-10)^
 Top 2 Box ^(9-10)^
 Bottom 2 Box ^(1-2)^
 ^ ^
```

**Annotated Output:**

```WCScript
T1^ # <TableIndex>^
 OR,OB,OS,S1,S2,O%,OI # <Settings>
 Product # <Section_Title>
 Total ^TN^0 # <Base_Size>
 ^ ^
 Q1. Overall Liking # <QuestionNumber>. <QuestionTitle>
 Like Extremely ^Q1_1(10)^ # <TableFormat::Full::MaxLabel> ^DataVar(MaxValue)^
 9 ^(9)^ # <TableFormat::Full::MaxLabelMin1> ^(MaxValue-1)^
 8 ^(8)^ # <TableFormat::Full::MaxLabelMin2> ^(MaxValue-2)^
 7 ^(7)^ # <TableFormat::Full::MaxLabelMin3> ^(MaxValue-3)^
 6 ^(6)^ # <TableFormat::Full::MaxLabelMin4> ^(MaxValue-4)^
 5 ^(5)^ # <TableFormat::Full::MaxLabelMin5> ^(MaxValue-5)^
 4 ^(4)^ # <TableFormat::Full::MaxLabelMin6> ^(MaxValue-6)^
 3 ^(3)^ # <TableFormat::Full::MaxLabelMin7> ^(MaxValue-7)^
 2 ^(2)^ # <TableFormat::Full::MaxLabelMin8> ^(MaxValue-8)^
 Dislike Extremely ^(1)^ # <TableFormat::Full::MaxLabelMin9> ^(MaxValue-9)^
 Mean ^(1-10)^SM # <TableFormat: Mean> ^<(ScaleValueLow-ScaleValueHigh)>^SM
 Top 3 Box ^(8-10)^ # <TableFormat: Top3Box> ^([MaxValue-2]-MaxValue)^
 Top 2 Box ^(9-10)^ # <TableFormat: Top2Box> ^([ScaleValueHigh-1]-ScaleValueHigh)^
 Bottom 2 Box ^(1-2)^ # <TableFormat: Bottom2Box> ^(ScaleValueLow-[ScaleValueLow+1])^
 ^ ^
```
