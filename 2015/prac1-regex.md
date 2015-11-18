# Computing in R - Practical 1: Regular expression

November 2015

Yannick Wurm, Rodrigo Pracana & others (incl. Robert Verity)

## Introduction

This practical series is aimed at teaching basic programming in R.  You should already be familiar with R from the work you have done in the past week. However! The ultimate aim of these practicals differs from your previous work in that the focus will be on creating, accessing, and manipulating different data structures. As this is often the first step in real scientific research, you will find that the skills you develop here will be invaluable to you later on in your studies (keep that project in mind)!  It's also a general (though very simple) introduction to programming: the stuff we will be learning about exists, in one way or another, in most other programming languages.

You will be pleased to hear that we will not be covering any stats in these practicals (you should already have mastered stats by now). However, do not relax too much, as these practicals will move fairly quickly, and you will need to stay focused in order to do well in the final exam. Refer back to your notes from last year, make use of R’s help system (and Google), your neighbour, and if you're really stuck don't be afraid to ask a demonstrator.

This practical is an introduction to regular expressions. Before we start, however, here is a note on good practice when coding.

## Good coding practice

Keep your code clean and tidy by making use of comments and white space and respecting the style guide. Comments start with the character `#` (R simply does not interpret anything written between a comment sign and the end of the line. They  allow you to annotate your code, i.e. to write helpful notes in between all the raw program code. Notice also that white space such as empty lines, spaces and indentations (obtained by pressing the Tab key) are invisible to R. Making good use of white space helps keep your code readable, and so does using clear and descriptive variable names.

There are several different style guides out there explaining which style to use. You can choose whichever you prefer - the importance is that you are clear and consistent. We will be following the [Hadley Wickham style guide](http://r-pkgs.had.co.nz/style.html).

The following two examples make the importance of good coding style clear. Both programs do exactly the same thing, but one will make sense one year from now, and the other will not!

```R
# Example 1
boooom <-0.01
blah2          =0.005
    blah3<- 0.0036
bigblah                           = boooom+ blah2        + blah3
tadayeahmanfunky<-100*exp(bigblah*10)
tadayeahmanfunky
```

```R
# Example 2

#--------------------------------
# Program:        PopSize.R
# Author:        Bob Verity
# Date:        01/10/2013
# Purpose:
# Works out the size of a population under a simple model of exponential growth.
# The growth rate is assumed to be equal to the sum of the nutrient content (% sugars),
# the temperature (centigrade above 20), and the humidity (%).
# Other parameters include the starting population size (number of individuals)
# and the time allowed to grow (hours).
#--------------------------------

# Define input parameters
nutrients     <- 0.01
temperature   <- 0.005
humidity      <- 0.0036
starting_size <- 100
grow_time     <- 10

# Calculate total growth rate
growth_rate <- nutrients + temperature + humidity

# Calculate population size at the end of the time period
end_size <- starting_size * exp(growth_rate * grow_time)

# Return end population size in the console
end_size

#--------------------------------
```

#### Q1. Write  your own well annotated and fully functional script for calculating the volume of a rectangular room with the following dimensions:
length: 5m
width: 4m
height: 3m
The layout and design of the program are much more important than the calculations here!

## Regular Expressions

Regular expressions are used to search for a specific pattern in a string. To understand them, we will take an example the actual in our data file are incorrect, or inconsistent. Run the following line of code to import the collections data frame:

```R
reptile_data <- read.table("http://wurmlab.github.io/teaching/2013sbc361/reptile_data.txt", row.names = 1)
```

This data frame details the genus and species names of 16 endangered reptiles, along with the date at which they were listed as endangered. You can load just the names into a separate variable by running the code

```R
reptile_names <- row.names(reptile_data)
```

Have a close look at these names. Notice that each reptile has been given a unique identification number next to its name (don't look these numbers up - they don't mean anything)! Also, we can see that some names have been recorded incorrectly - the genus names for the *Liopholis* group have been recorded in lowercase, while we all know that genus names should be capitalized! All in all, this data appears quite "messy" and needs cleaning up.

The tools that allow us to deal with this sort of problem fall under the heading regular expressions. These consist of a suite of tools that allow us to search for, locate, and replace characters or words within a data set. The really powerful thing about regular expressions is that we can do a "fuzzy" search, meaning the pattern we are searching for has some flexibility built into it.

### Basic find and replace
First of all we will search through the vector reptile_names to find a list of the elements that contain the word "liopholis". The function that allows us to do this is `grep()`, which has two main arguments; `pattern` and `x`. The pattern is the actual word, or part of a word, that we are looking for. The argument x describes the variable that we are searching through. In our case we want to evaluate the following code:

```R
# Search through reptile_names for the word "liopholis", and output positions
grep(pattern = "liopholis", x = reptile_names)
```

The output of this code is a list of numbers. Each of these numbers describes the position of an element in the vector `reptile_names` that matches the pattern - in this case the 12th and 13th elements. Make sure you fully understand where these numbers came from!

Sometimes it may be more useful to obtain the actual names within which the pattern was found, rather than a list of positions. We can do this by making use of the additional argument `value = T` (see the help file for the `grep()` function for a complete list of possible arguments). The new code reads:

```R
# Search through reptile_names for the word "liopholis", and output names
grep(pattern = "liopholis", x = reptile_names, value = T)
```

Now we find that the output contains the actual elements of the vector that match the pattern, rather than just a list of positions. These names should correspond exactly with the positions found in the previous example.

Finally, we may want to find and replace the pattern. This can be done using the function `gsub()`. The function `gsub()` takes arguments `pattern` and `x`, just like the function `grep()`, but it also has an additional argument replacement. The argument replacement describes the new word, or words, that we want to insert in place of pattern. For example, in the `reptile_data` the word "liopholis" is a genus name, and so should be capitalized. Thus, we want to replace the word "liopholis" with "Liopholis", as follows:

```R
# Search through reptile_names for the word "liopholis" and replace with the word "Liopholis."
reptile_names2 <- gsub(pattern = "liopholis", replacement = "Liopholis", x = reptile_names)
```

The output of this function is a new vector in which the desired replacement has been carried out. Notice that the code above stores this new vector in the variable reptile_names2.
Experiment with `grep()` and `gsub()` until you are confident at using them. Then answer the following questions:

#### Q2. How could you use regular expressions to find the only element in the vector `reptile_names` that contains a lowercase "q"? What is the position of this element in the vector?

#### Q3. You want to import the `reptile_names` data into excel, but are having problems due to the spaces between the words (a common problem). How could you use `gsub()` to replace all spaces with a period?

### Using "fuzzy" searching
One of the most powerful features of regular expressions is the ability to perform "fuzzy" searching. Simply put, by using special characters we can introduce some flexibility into the pattern that we are searching for.

A slightly reduced list of special characters and their meanings is given below.

|Special Character | Meaning  |
|------------------|----------|
|.                 | Any character |
|?                 | The preceding item is optional and will be matched at most once. |
|*                 | The preceding item will be matched zero or more times. |
|+                 | The preceding item will be matched one or more times. |

Additional special characters can be found:

* by Googling (e.g., "Regexp cheat sheet for R")
* in the slides for our course (from slide 45): http://www.slideshare.net/yannickwurm/2014924sbc361researchmethcomm
* by typing: ?regex in R

These special characters can be used on their own, or in combination with one another. To help you out with understanding these symbols, here are a few examples:

* The pattern `.r` means any character, followed by the letter "r" (e.g. "er", "or", "tr", "3r").
* The pattern `...r` means any character, followed by any character, followed by any character, followed by the letter "r" (e.g. "beer", "deer", "zekr").
* The pattern `l*at` means zero or more copies of the letter "l", followed by the letters "at" (e.g. "at", "lat", "llllllllllat").
* The pattern `s.+s` means the letter "s", followed by one or more copies of any character, followed by the letter "s" (e.g. "sas", "sts", "sauces", "serendipities", but NOT "ss").
* The pattern `.* .*` means zero or more copies of any character, followed by a space, followed by zero or more copies of any character (any combination of two words, e.g. "test word").
Some of these examples might seem very confusing at first, but if you learn what each special character means on its own and then go through the pattern one at a time you should find that it makes sense.

As an example of how fuzzy searching can be useful, we will now use these special characters to remove the ID tags from the reptile names. Notice that the ID numbers are of different lengths, but they are always separated with a colon from the part that we are interested in. Therefore, we can remove these characters by searching for zero or more copies of any character, followed by a colon, and replacing this pattern with an empty string. The single line of code that achieves this is as follows:

```R
reptile_names3 <- gsub(pattern = ".*:", replacement = "", x = reptile_names2)
```
Have a look inside the variable reptile_names3. We have successfully isolated the genus and species names away from the pesky ID tags, even though the exact format of the tags may vary between different entries. Tricks like this can save us a great deal of time - especially when our data set is thousands of lines long. In fact, we have only skimmed the surface of what regular expressions can do - I encourage anyone who is interested to take a deeper look.

#### Q4. What does the pattern "..x.." mean in a regular expression?

#### Q5. What does the pattern "e+" mean in a regular expression?

#### Q6. How many reptile names (genus or species) contain a lowercase "o" or an uppercase "E"?

#### Q7. Add three additional columns to the `reptile_data` table:
* one containing only the identifier numbers (e.g. 1423 without the “ID”)
* one column containing only the genus (e.g. Bellatorias)
* one containing only the species (excluding the subspecies, e.g. tympanum)
Hint - try to decompose this task, the solution is not a “one-liner”. Make use of the functions you have just learnt and focus on extracting the numbers, genus, and species, rather than the “add new columns” bit.

#### Hacker Q8.  Figure out how to “capture” the first letter of the species, and transform it to make it uppercase. Do this in a generic manner (that would work on a table of thousands of species).
Hint - look into the help page of “gsub”, especially the explanation for the “replacement” parameter, as well as the examples at the bottom of the help page.
