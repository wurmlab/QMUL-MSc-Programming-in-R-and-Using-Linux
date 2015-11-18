# Computing in R

SBSM032: stats and bioinformatics

November 2014

Yannick Wurm and Rodrigo Pracana (and Robert Verity)

## Introduction

This practical is aimed at teaching basic programming in R. The stuff presented here will hopefully be helpful for handling and formatting data. It's also a general (though very simple) introduction to programming: the stuff we will be learning about exists, in one way or another, in most other programming languages.

## Regular Expressions
Regular expressions are used to search for a specific pattern in a string. To understand them, we will take an example the actual in our data file are incorrect, or inconsistent. Run the following line of code to import the collections data frame:
```R
collections <- read.csv("http://yannick.poulet.org/teaching/2014msc/ant_collections.csv")
```
This data frame details the genus and species names of some ants, along with the date at which they were collected and some extra stuff. Load just the names into a separate variable:
```R
ant.names <- collections$ID.Genus_species
```
Have a close look at these names. Notice that some names have been recorded neglectfully. For example, the genus names for the Pheidole group are sometimes lowercase, and include spelling mistakes. This data needs cleaning up.

Regular expressions help us to deal with this sort of problem. They consist of a suite of tools that allow us to search for, locate, and replace characters or words within a data set. The really powerful thing about regular expressions is that we can do a "fuzzy" search, meaning the pattern we are searching for has some flexibility built into it.

### Basic find and replace
To start with we will consider a simple case of finding a pattern within a vector of names.  First of all we will search through the vector ant.names to find a list of the elements that contain the word "pheido". The function that allows us to do this is `grep()`, which has two main arguments; `pattern` and `x`. The pattern is the actual word, or part of a word, that we are looking for. The argument x describes the variable that we are searching through. In our case we want to evaluate the following code:
```R
# Search through reptile.names for the word "pheido", and output positions
grep(pattern= "pheido", x=ant.names)
```
The output of this code is a list of numbers. Each of these numbers describes the position of an element in the vector `ant.names` that matches the pattern. Make sure you fully understand where these numbers came from!

Sometimes it may be more useful to obtain the actual names within which the pattern was found, rather than a list of positions. We can do this by making use of the additional argument `value = T` (see the help file for the `grep()` function for a complete list of possible arguments). The new code reads:
```R
# Search through reptile.names for the word "pheido", and output names
grep(pattern= "pheido", x=ant.names, value=TRUE)
```
Now we find that the output contains the actual elements of the vector that match the pattern, rather than just a list of positions. These names should correspond exactly with the positions found in the previous example.

Finally, we may want to find and replace the pattern. This can be done using the function `gsub()`. The function `gsub()` takes `arguments`, `pattern` and `x`, just like the function `grep()`, but it also has an additional argument replacement. The argument replacement describes the new word, or words, that we want to insert in place of pattern. For example, in the ant.names the word "pheidole" is a genus name, and so should be capitalized. Thus, we want to replace the word "pheidole" with "Pheidole", as follows:
```R
# Search through reptile.names for the word "pheidole" and replace with the word "Pheidole."
ant.names.better <- gsub(pattern="pheidole", replacement="Pheidole", x=ant.names)
```

The output of this function is a new vector in which the desired replacement has been carried out. Notice that the code above stores this new vector in the variable ant.names.better.

Experiment with `grep()` and `gsub()` until you are confident at using them. Then answer the following questions:

#### Q1. How could you use regular expressions to find the only element in the vector `ant.names` that contain lowercase "v"? What are the positions of this element in the vector?

#### Q2. You want to import the `ant.names` data into excel, but are having problems due to the spaces between the words (a common problem). How could you use `gsub()` to replace all spaces with an underscore?

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
* by typing ?regex in R

These special characters can be used on their own, or in combination with one another. To help you out with understanding these symbols, here are a few examples:

* The pattern `.r` means any character, followed by the letter "r" (e.g. "er", "or", "tr", "3r").
* The pattern `...r` means any character, followed by any character, followed by any character, followed by the letter "r" (e.g. "beer", "deer", "zekr").
* The pattern `l*at` means zero or more copies of the letter "l", followed by the letters "at" (e.g. "at", "lat", "llllllllllat").
* The pattern `s.+s` means the letter "s", followed by one or more copies of any character, followed by the letter "s" (e.g. "sas", "sts", "sauces", "serendipities", but NOT "ss").
* The pattern `.* .*` means zero or more copies of any character, followed by a space, followed by zero or more copies of any character (any combination of two words, e.g. "test word").

Some of these examples might seem very confusing at first, but if you learn what each special character means on its own and then go through the pattern one at a time you should find that it makes sense.

As an example of how fuzzy searching can be useful, we will now use these special characters to remove the ID tags from the ant names. Notice that the ID numbers are of different lengths, but they are always separated with a colon from the part that we are interested in. Therefore, we can remove these characters by searching for zero or more copies of any character, followed by a colon, and replacing this pattern with an empty string. The single line of code that achieves this is as follows:
```R
ant.names.better.clean <- gsub(pattern=".*:", replacement="", x=ant.names.better)
```
Have a look inside the variable `ant.names.better.clean`. We have successfully isolated the genus and species names away from the pesky ID tags, even though the exact format of the tags may vary between different entries. Tricks like this can save us a great deal of time - especially when our data set is thousands of lines long. In fact, we have only skimmed the surface of what regular expressions can do - I encourage anyone who is interested to take a deeper look.

#### Q3. What does the pattern "..x.." mean in a regular expression?

#### Q4. What does the pattern "e+" mean in a regular expression?

#### Q5. How many names (genus or species) contain a lowercase "o" or an uppercase "E"?

Hint - you will have to combine your knowledge of regular expressions with your knowledge of logical expressions to answer this one!

#### Q6. Add three additional columns to the ant.data table:
* one containing only the collection identifier numbers (e.g. 1423 without the "MB")
* one column containing only the genus (e.g. Polyrhachis)
* one containing only the species (excluding the subspecies, e.g. hemioptica)

Hint -the solution is not a "one-liner":  try to decompose this task into several steps. Make use of the functions you have just learnt and focus on extracting the numbers, genus, and species first. Only subsequently add the new columns.

#### Hacker Q7.  Figure out how to "capture" the first letter of the species, and transform it to make it uppercase. Do this in a generic manner (that would work on a table of thousands of species).

Hint - look into the help page of `gsub`, especially the explanation for the "replacement’" parameter, as well as the examples at the bottom of the help page.

For more information on these species check Antweb (and create a field guide for your next trip! (example pdf)).

## Functions

Functions are pieces of code that are made to take an input (generally known as arguments), do something with it, and give back an output. They are interesting because they allow you to run the same piece of code multiple times without having to write it entirely at each time.
To take a self-explanatory example:
```R
x      <- c(2,3,4,5)
x.mean <- mean(x)
```
We just used the `mean()` function, one of many functions loaded by default in R. The point of this function is that you can calculate the mean of any vector without explicitly writing the formula for the `mean` each time. The interesting thing about R is that it is possible to create your own functions. Let's create our own function to calculate the mean:
```R
## Define function named myMean

myMean <- function(my.vector) {
  ## Calculate the mean
  my.mean <- sum(my.vector)/length(my.vector)

  ## Return the calculated mean
  return(my.mean)
}

## Now call the function on some data:
x      <- c(2,3,4,5)
x.mean <- myMean(x)
```

The syntax `functionName <- function(parameter) {code}` is the most common way of defining a function. Remember to add the `return()` bit, otherwise the function will compute the code but it won't return anything!

Now take a look at the following code. This code is designed to take a number in seconds, and convert it into hours, minutes and remaining seconds (don't worry too much about the computation in the middle):

```R
# Input raw number of seconds
number.of.seconds <- 19955

# Convert number.of.seconds into hours, minutes, and seconds
hours		<- floor(number.of.seconds /(60*60))
minutes	<- floor((number.of.seconds -hours*(60*60))/60)
seconds	<- number.of.seconds -((hours*60)+minutes)*60

# Create a single vector containing all three quantities
outputvec <- c(hours, minutes, seconds)

# Output the solution to the console
outputvec
```

#### Q7. Modify the code above to make it into a function called `timeConverter()`. Can you run it on the numbers 5s, 50000s and 10000000s? Remember to indent any code inside the curly bracket.

#### Q8. Write your own function for converting distances between different units. Your function should take the distance in kilometres as input, and return the distance in miles as output (8 kilometres is roughly equal to 5 miles). Remember to clearly annotate your code, and make appropriate use of white space.

### More complex functions
Hopefully you can already see how functions can be very useful things. We can make them even more useful by considering some simple extensions.

First, you can define multiple arguments to a function, with the general sytax of a function being: 

```R
my_function <- function(argument1, argument2, ...) {
    #code including argument1, argument2, ...
}
```

#### Q9. To understand how a function can have multiple arguments, modify the function `timeConverter()` so that adds a given number of hours to the result. You will have to include a new parameter (you can call it `additional.hours`), and add it to the `hours` variable.

Note that functions do not have to take single numbers as input. They can take vectors, matrices, data frames, or any other type of object, and they can also take character and logical data as well as numerical.

#### Q10. Make a function takes a vector of words as input, and outputs the number of characters in the longest word.

#### Q11.A Extra arguments: 
Another neat thing that we can do is set default values for our arguments. Have another look at the `timeConverter()` function you modified in Q9. Most of the time, you will probably want run it with `additional.hours` being 0. To do this, you can make `additional.hours=0` as a default. With default valus for arguments,function take the syntax `myFunction <- function(argument1, ..., argument2=default) {code including argument1, argument2, ...}`. The default argument generally goes in the end of the argument list.

#### Q11.B Make the `additional.hours` be defined as 0 by default in the `timeConverter()` function. Run it without defining `additional.hours` and defining it to different number of seconds.

#### Q12. This task is a bit more challenging! Go back to your function for converting kilometres to miles; make a copy with an appropriate new name. The new extended function you must create should:

* take a distance in kilometres and a time in minutes as input.
* convert the distance into miles, and the time into hours. It should then calculate a speed in miles per hour.
* return the speed in miles per hour as output.

All of the skills required to complete this task this are given above. Take your time, and approach this problem one step at a time.

## Loops
Imagine you need to run the function `timeConverter()` on different numbers. You could type `timeConverter()` many different types, each time with a different number. But now imagine you had to type that thousands of times. It would be impossible.

Fortunately, computers were built to perform same task over and over again many times. They do this using a construct called a *loop*. Although there are several types of loops, we are going to learn about the for loop. It works this way:

```R
## For loop exmaple
for (seconds in c(1000,2000,3000)) {
  time.in.hours <- timeConverter(number.of.seconds=seconds)
  print(time.in.hours)
}
```
The loop will run 3 times. Each time, it will define the variable `seconds` as a different number from the vector `(1000,2000,3000)`. It will compute a new time in hours and print it.

### Slightly more complex loops
There are some interesting ways in which we can stretch our understanding of loops. First of all, it is important to recognise that the values that we are indexing over can be anything that goes in a vector. The vector can be defined outside the loop definition line:

```R
## Sequential loop values
loop.values <- c(15,5,2.3,100,16)
for (index in loop.values) {
	print(index)
}

## Non-sequential loop values
seq.values <- c(1:50)
for (i in loop.values) {
  print(i)
}

## Character based loop values
loop.text <- c("How", "Now", "Brown", "Cow")
for (index in loop.text) {
	print(index)
}
```
Another important way of extending loops is to consider nested loops - in other words, loops within other loops! Have a look at the following code:
```R
for (i in 1:5) {
	for (j in 7:9) {
		print(c(i,j))
	}
}
```

Here we have one loop (with index j) nested within another loop (with index i). I have also defined the values that i and j can take directly within the loops, rather than outside of the loops as in previous examples - this is simply a way of saving space. Evaluate this code and try to make sense of the output. Fiddle around with the different elements of this code until you are comfortable with nested loops. Warning - loops require your computer to perform many operations, and as such it is quite easy to crash R using loops. A simple block of code evaluated 100,000 times amounts to quite a big job. If you want to force R to exit a loop part way through, simply press Esc. Nested loops are particularly hazardous!

Once you are comfortable with loops, have a go at the following tasks:

#### Q13. Write a loop that iterates over the numbers 10 to 100, and prints out the index of the loop each time through.

#### Q14. Write a loop that iterates over the numbers 16 to 49, and prints out the square root of the index each time through (you may have to search around for the square root function).

#### Q15. Write a loop that iterates over all even numbers between 30 and 90. Each time round evaluate the function timeconverter() on the indexed value, and print the solution to the console.

#### Q16. Write a loop that calculates the product of all numbers from 1 to 10, and then subtracts the numbers 1 to 10 in turn.  i.e.  (product)-1, then (product)-2, followed by (product)-3…  etc).

#### Q17. Create a nested loop. The outer loop should be over the words "Angry", "Lazy" and "Happy". The inner loop should be over the words "birds", "dogs", and "cows". The code inside the inner loop should print out a vector containing the indexes of both loops (for example "Angry" and "birds" in the first instance).

#### Q19. Write a third-degree nested loop. Be careful not to loop over too many values or you will crash R!

### Storing loop results

More often than not, you will not want to just print the loop results. Instead, you may want to keep them in a separate variable. Check the following example. What's the result from the 4th iteration?

```R
## Vector to loop through
practical.attribute.vec <- c("great", "boring", "very long", "informative", "here")

## Empty vector to keep loop results
phrase.vec <- c()

for (practical.attribute in practical.attribute.vec) {
  phrase     <- paste("This practical is", practical.attribute, collapse=" ")
  phrase.vec <- c(phrase.vec, phrase)

}
```
A different way of approaching a for loop is to loop through the indexes of a vector, rather than the vector itself. In the following code, we also create a vector for the result with the same length as the vector we are looping through, and we use the index to 'populate' it:

```R
## Vector to loop through
practical.attribute.vec <- c("great", "boring", "very long", "informative", "here")

## Empty vector to keep loop results
phrase.vec <- rep(NA, length(practical.attribute.vec))

## Loop through the index rather than the vector
for (i in 1:length(practical.attribute.vec)) {

  ## Create phrase, getting attribute from practical.attribute.vec[i]
  phrase     <- paste("This practical is", practical.attribute.vec[i], collapse=" ")

  ## Add phrase to the right index of the results vector
  phrase.vec[i] <- phrase

}
```

We will now take the last approach to reformat data, for which loops tend to be particularly useful. By looping through all of the fields of a particular data set, and at each iteration dropping the relevant entry into a new data structure, it is possible to convert from one data format to another.

The data set that we will use in this example is typical of the sort of data that you might be faced with in the future. Load the data by running the following line of code:
```R
helianthus.data <- as.matrix(read.table("http://www.antgenomes.org/~yannickwurm/tmp/HelianthusData_num.txt ", header=T))
```

Each row in this data set represents a different strain of *Helianthus annuus* (sunflowers), grown under controlled conditions. The first column tells us the Strain (these are numbered 1 to 5). The remaining columns describe the number of plants found in the study area at six different points in time. For example, looking at the first row, we can see that strain 1 started out with 12 plants, but by the final time point contained 57 plants.

#### Q20 The aim of the following exercice is to get the data from the current format into what's generally called the 'long format'

We want to get this data into a new format - sometimes called long format - in which we have a matrix of three columns; the first column describes the strain, the second column describes the time point, and the third column describes the number of plants observed. The first few lines of this new data structure should look like this:
```
Strain	Time	Count
1	0	12
1	1	33
1	2	71
1	3	61
1	4	73
1	5	57
2	0	10
2	1	27
...
```
We can make the transition from the wide format of helianthus.data to the long format described above using a nested loop. But first, let us create an empty matrix, which we will eventually fill with our new values.

#### Q20.a. Create an empty matrix, called `long.data`. This matrix must have 3 columns, and 30 rows (the number 30 comes from the fact that we have five strains at six time points each). Name the columns `c("Strain", "Time", "Count")`.

With this empty matrix created, we can move on to the next part of the problem - populating it with values. We want to look at each of the elements of helianthus.data one after the other, using a nested loop. The basic structure of this nested loop is as follows:
```R
# Loop through all rows
for (myrow in 1:5) {
	# Loop through all columns except the first
	for (mycol in 2:7) {

		# This is where the main code goes.

	}
}
```
Here we are using loops to index through each of the rows of the matrix helianthus.data, and for each row we are indexing through columns 2 to 7 (as these are the columns that contain relevant data). At any point in the two loops, the value that we are focusing on is given by `helianthus.data[myrow,mycol]`.

Hopefully you can already see that these are the exact values we want to drop into the third column of our matrix `long.data`. However, we are presented with a problem - how do we drop these values one after the other into the right place in the matrix` long.data`? We cannot use the index myrow to help us, as this only goes through values `1:5`. Similarly, we cannot use the `index mycol`, as this only goes through values `2:7`. What we really need is a new index that goes all the way from 1 to 30, irrespective of the row or column that we are focusing on.

#### Q20.b. Change the for loop above to include a variable `myindex`. This variable should be defined as being 0 before the loop starts. At every iteration of the inner loop, you should add 1 to it.

Now that we have three indices - one going through the rows of helianthus.data, one going through the columns of helianthus.data, and one simply going from 1 to 30 - we have all the ingredients we need to populate the matrix `long.data`. The code we need at each iteration of the loop is the following:
```R
long.data[myindex,3] <- helianthus.data[myrow,mycol]
```
This is fairly straightforward. We also want to drop the time point in the second column of long.data. Although we do not have a vector describing each of the time points, in fact the timings are very simply given by mycol minus two. For example, if we are looking at the fourth column then we are looking at the second time point. Therefore, we need the following line of code to extract the timings:
```R
long.data[myindex,2] <- mycol-2
```

Finally, we want to drop the strain type into the first column of long.data. The strain type is given by the first element in every row, meaning it is given by helianthus.data[myrow,1]. Therefore, we need the following line of code to extract the strain types:
```R
long.data[myindex,1] <- helianthus.data[myrow,1]
```
#### Q20.c. Bring all of this together to finish the for loop, and run it!


## If statements

Often, we may want to perform different operations depending on a condition. You do this using the if statement. Check the following example:
```R
x <- 6

if (x > 5) {
  x <- x - 1
}

print(x)
```
If statements work using conditional statements. As long as what is inside the round brackets is TRUE, the code is ran, otherwise it's skipped. It's possible to evaluate different conditions; keeps on skipping code until it finds a condition that is TRUE, then it stops (it won't evaluate the second condition if the first is TRUE, regardless of the second condition being TRUE)

```R
this.practical <- 'interesting'

if (this.practical == 'boring') {
  print ('YAWN!')
} else if (this.practical == 'interesting') {
  print('We want more!')
} else {
  print('I do not know how to evaluate this practical')
}

```

The conditions need to follow the rules of conditional statements. You can find more information in the Rbasics document. It also follows boolean logic, which you should also read about (which defines how R evaluates statements like `TRUE & FALSE` or `(TRUE & TRUE) | (FALSE & TRUE) & TRUE`).

#### Q21 Add another argument to the function created in question Q12, to allow the user to ask for the speed in metric (km/h) or imperial (miles/h) units. Make sure you use an if statement!

#### Q22 Make a for loop that runs from numbers 1 to 10000. Make it stop early when the sum of all numbers that have been looped through gets larger than 50000. How many times did the loop run for? You will have to use the function `break` to break out of the loop early.

#### Q22.a (hacker bonus) A more elegant way of doing question Q22 would be to use a while loop instead of a for loop. Give it a try if you have time (it doesn't use an if statement).


# Extra exercices

The following exercices use a bit of everything we have learned here. Don't be worried if you cannot finish it in class, but make sure to try finishing the exercices at home! You can do the bonus/hacker question later if you wish to.

#### Q23. Write a function that converts a short DNA sequence of 15 bases (eg ACCTGTCATCATCCC) to RNA, and splits the string into triplets. You will need to:

   		 1. replace T with U  (thymine with uracil to convert DNA to RNA)
        		 2. use `substring()` to split the sequence into triplets, and `seq()` within `substring()`
        		 3. return the RNA triplets string

Note `substring()` takes a "first" and "last" argument. The "first" would be `seq()` indicating where the beginning of your first triplet is and where the beginning of your last triplet is. The "last" argument would be `seq()` indicating where the end of your first triplet is, and the end of your last triplet.  In `seq()` you will also indicate you want triplets.  

As an example:
```R
dna.string<-c("AAATTT")
substring(dna.string, seq(1, 4, by=3), seq(3, 6, by=3))
```

Once you have created the function, see if you can modify the function to work for a sequence with any number of characters. Tip: you can use `nchar()` to create a variable such as `num.characters`.


#### Q24 (Bonus question). Write a function to obtain the reverse-complement of a DNA sequence.

You can use this sequence: `"ATTACGACGCGATTCCCGGTTAATCGAATTCCCA"`. As an example, the complement of ATGC is TACG.

The tricky part here is reversing a single string of characters. Search around for `strsplit`.  You will need to:
* replace bases with their complement
* split the string of DNA bases into separate characters with `strsplit`. Note that `strsplit` returns a list, so you will need to use `unlist()` to obtain a string
* reverse the sequence
* remove the spaces to get your single string of DNA bases
* return the reverse-complement sequence

#### Q25 (Hacker question). Translate your triplet string from Q12 into amino acids
Note: depending on your method, you may not need to convert it to RNA first.  You can use a codon-to-amino-acid table and code the translation yourself. Alternatively, you could  search around and load a specific package for the manipulation of biological sequences.



#### Q26. Write a function that assesses whether a given word or phrase is a palindrome
Palindromes are arrangements of words or letters which read the same way whether you read them backwards or forwards, such as the phrase ‘Never odd or even’. In molecular biology, many restriction enzyme sites are palindromic. Before starting to code, think about the steps that you would need to go through in order to judge if something was a palindrome or not, write these steps as comments in an R script window, then think about how you can tell the computer to execute those steps. Only start writing the code when you have a plan of what you want to do. Don’t be afraid to test lines independently in the console and to use easy test cases where you know the answer in order to check that your function works.

The bottom section of the R help sheets normally have examples of how a command can be used. Sometimes one of these examples will be a way to solve the problem that you are currently working on. The `strsplit` helpsheet is particularly interesting in relation to this question.

#### Q27 (bonus question). Write a function that assesses whether a DNA sequence is palindrome
Palindromes in molecular biology work a little differently, in that the sequence is the same if read 5’ to 3’ on one strand or 5’ to 3’ on the complementary strand. For example, ACCTAGGT is a palindromic DNA sequence as its complement is TGGATCCA.

#### Q28. Write a function which uses regular expressions to detect if a given sequence contains an open reading frame (ORF). Test it on the following sequences:
```
ATGGATTTTTAG
ATGGATTTTCTAG
CTAATGGATTTTTGAAT
atgctaaactaa
```
Protein-coding regions in the genome can be predicted by detecting open reading frames. An open reading frame normally begins with the start codon ‘ATG’ and ends at one of three possible stop codons, ‘TGA’, ‘TAA’ and ‘TAG’. The sequence in between these two points is arranged in 3-base codons.

#### Q29 (hacker question). Instead of having the function return whether your sequence contains an open reading frame, have the function return a string containing the open reading frame if there is one and NULL if there is not.

#### Q30 Write a function that adds a new column in the data frame that contains the correct Latin species name for each record in the data frame imported below.

Run the following line of code to import the butterfly.sample data frame:
```R
butterfly.sample <- read.table("http://yannick.poulet.org/teaching/2014sbc361/ButterflySample.csv",sep = ",", header = T)
```
This data frame contains information on butterflies caught in sweep netting surveys in two locations (A and B). This data was collected by multiple people, and they have not recorded the species that they encountered the same way - some have used latin names for species and others common names, for example. In order to be able to compare the diversity between the two different sites, you will need to standardise the names.

You will also need to import the butterfly.reference data frame to help you do this:
```R
butterfly.reference <- read.table("http://yannick.poulet.org/teaching/2014sbc361/ButterflyReference.csv",sep = ",", header = T)
```
TIP: There are several ways to do this. Remember that R is case sensitive, so you will need to account for case differences in your function. `grep` and `gsub` both allow you to set an `ignore.case = T` option. Alternately, you could use the R commands `toupper()` and `tolower()`. Use the help pages to see how these work, which you can access by typing a question mark before the command - `?toupper`.

#### Q31. From the data above, which location has the greatest number of different species?

#### Q32. Which genus has been caught the greatest number of times?
