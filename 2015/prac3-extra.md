# Computing in R - Practical 3

November 2015

## Introduction

The following exercises use a bit of everything we have learned in the past few days. Don't be worried if you cannot finish it in class, but make sure to try finishing the exercises at home! You can do the bonus/hacker question later if you wish to.

## Recap questions
To get back into gear in terms of thinking about programming, we’ll start with a quick recap exercise of the material from last week:

#### Intro Q1. Write a `for` loop that calculates the sum of 1/13 + 1/14 + 1/15… all the way up to 1/32. Note that R will not create the correct vector if you tell it ‘1/13:1/32’!

*It is possible to get the answer to this exercise without writing a loop, by using `sum()`. However, the idea of this exercise is to practice writing `for` loops - so write a `for` loop.*

#### Intro Q2. Create a function that can run this loop between any two denominators (so from `1/x` to `1/y`, where `x` and `y` are inputs to the function).

## Palindromic Sequences

Palindromes are arrangements of words or letters which read the same way whether you read them backwards or forwards, such as the phrase ‘Never odd or even’. In molecular biology, many restriction enzyme sites are palindromic.

#### Q1. Write a function that assesses whether a given word or phrase is a palindrome.
Before starting to code, think about the steps that you would need to go through in order to judge if something is a palindrome or not. Write these steps as comments in an R script window, then think about how you can tell the computer to execute those steps. Only start writing the code when you have a plan of what you want to do. Don’t be afraid to test lines independently in the console and to use easy test cases where you know the answer in order to check that your function works.

The bottom section of the R help sheets normally have examples of how a command can be used. Sometimes one of these examples will be a way to solve the problem that you are currently working on. The `strsplit` helpsheet is particularly interesting in relation to this question.

#### Q2. Write a function that assesses whether a DNA sequence is palindrome. You will need to convert it to its reverse complement and then compare this to the original sequence. Again, there are commands which may help you in the ‘Working with DNA data’ section from the last session.

Palindromes in molecular biology work a little differently, in that the sequence is the same if read 5’ to 3’ on one strand or 5’ to 3’ on the complementary strand. For example, ACCTAGGT is a palindromic DNA sequence as its complement is TGGATCCA.

## Open Reading Frames
Protein-coding regions in the genome can be predicted by detecting open reading frames. An open reading frame normally begins with the start codon ‘ATG’ and ends at one of three possible stop codons, ‘TGA’, ‘TAA’ and ‘TAG’. The sequence in between these two points is arranged in 3-base codons.

#### Q3. Write a function which uses regular expressions to detect if a given sequence contains an open reading frame (ORF). Test it on the following sequences:

```
ATGGATTTTTAG
ATGGATTTTCTAG
CTAATGGATTTTTGAAT
atgctaaactaa
TCGATTAA
```

#### Q4a. (hacker question) Instead of having the function return whether your sequence contains an open reading frame, have the function return a string containing the open reading frame if there is one and NULL if there is not (you will need to look up "if statements").

#### Q4b. (hacker question) This time, check both the forward and reverse strand for ORFs. Return `"forward_only"` if there is an ORF only on the forward strand, `"reverse_only"` if only on the reverse, `"both"` if in both or "none" if in neither.

## Species names
Run the following line of code to import the `butterfly_sample` and the `butterfly_reference` data frames:

```R
butterfly_sam_url <- "http://wurmlab.github.io/SBC361-programming-in-R/ButterflySample.csv"
butterfly_sample  <- read.csv(butterfly_sam_url, header = T)

butterfly_ref_url   <- "http://wurmlab.github.io/SBC361-programming-in-R/ButterflyReference.csv"
butterfly_reference <- read.csv(butterfly_ref_url, header = T)
```

The `butterfly_reference` data frame contains the species name and the common name of a number of butterflies.

The `butterfly_sample` data frame contains information on butterflies caught in sweep netting surveys in two locations (A and B). This data was collected by multiple people, who have recorded the common names of the species they encountered (without using a standard letter case). In order to be able to compare the diversity between the two different sites, you will need to standardise the names.

#### Q5 Write a function that adds a new column in the data frame that contains the correct Latin species name for each record in the `butterfly_sample`.

TIP: There are several ways to do this. Remember that R is case sensitive, so you will need to account for case differences in your function. `grep` and `gsub` both allow you to set an `ignore.case = T` option. Alternately, you could use the R commands `toupper()` and `tolower()`. Use the help pages to see how these work, which you can access by typing a question mark before the command - `?toupper`.

#### Q6. From the data above, which location has the greatest number of different species?

#### Q7. Which genus has been caught the greatest number of times?


# Bonus hacker question

This question is an extension of the question Q5. Again, we will analyse a data frame containing the species of butterflies observed in two locations (A and B). This time, however, some of the people who did the sampling recorded the common name of the species, while others recorded the latin name (all with inconsistent letter case).

#### Q8 Write a script that adds a new column in the data frame that contains the correct Latin species name for each record in the data frame imported below.

```R
butterfly_sam_url <- "http://wurmlab.github.io/SBC361-programming-in-R/ButterflySampleBonus.csv"
butterfly_sample  <- read.csv(butterfly_sam_url, header = T)

butterfly_ref_url   <- "http://wurmlab.github.io/SBC361-programming-in-R/ButterflyReference.csv"
butterfly_reference <- read.csv(butterfly_ref_url, header = T)
```

One of the difficulties of this exercise is that you will have to perform a different process depending on whether the sample already has its latin name or not. You may find that using `if` statements may be helpful (which you will have to look up). Alternatively, you may want to subset the data into the two groups (where the transformation is either from latin to latin or common to latin), and do the transformation independently on each.

This question is not easy! But it is typical of the sort of thing researchers do from day to day and a very good test of all the things you have learned this year!
