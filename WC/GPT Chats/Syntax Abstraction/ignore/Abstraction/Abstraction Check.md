
```
## Language Specification

We are writing a language specification for WCScript - a domain specific language used to generate crosstables for consumer market research survey questions.

We have multiple objectives.

- **Describe the syntax**

- **Map inputs to outputs**

- **Refine abstraction**

## Software Development

We are in the very early stages of developing software that will create the tables. The software will eventually be written in Python.

Read the `Abstraction-Example.md` and describe the syntax. Also describe the syntax abstraction. We need to determine if there is a more efficient way to abstract out the syntax. Ignore everything in the `ignore` file.
```

Follow the instructions of the prompt in the codeblock present. THe prompt starts from "Read". Everything before then is additional context.

# GPT

The syntax of WCScript, as described in Abstraction-Example.md, is a domain-specific language used to generate crosstables for market research survey questions. It uses a combination of symbols, punctuation, and words to define the structure of the tables.

The syntax can be broken down into several components:

- <TableIndex>: This is the index of the table, denoted by T1^ in the raw output.
- <Settings>: These are the settings for the table, such as OR,OB,OS,S1,S2,O%,OI.
- <Section_Title>: This is the title of the section, such as Product.
- <Base_Size>: This is the base size of the table, denoted by Total ^TN^0.
- <QuestionNumber>. <QuestionTitle>: This is the question number and title, such as Q1. Overall Liking.
- <TableFormat::Full::MaxLabel> ^DataVar(MaxValue)^: This is the format for the full table, with the maximum label and data variable.

The syntax abstraction is a way to generalize the syntax to make it more efficient and easier to understand. For example, instead of writing out Like Extremely ^Q1_1(10)^, you can write <TableFormat::Full::MaxLabel> ^DataVar(MaxValue)^.

The abstraction also allows for more flexibility. For example, the <TableFormat: Bottom2Box> abstraction allows you to easily change the range of values for the bottom 2 box.

```text
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
```

In terms of efficiency, the current abstraction seems to be quite efficient as it allows for a high level of customization and flexibility. However, without more context or specific issues, it's hard to suggest improvements. If there are common patterns or repeated code that could be abstracted further, that could be a potential area for improvement.
