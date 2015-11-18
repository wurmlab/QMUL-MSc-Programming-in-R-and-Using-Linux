# Introduction: the basics
## The environment
To start with, let us reacquaint ourselves with the R environment. First of all, launch R (in the computer room, probably the “Bio version” if there are several to choose from; but any R install should be fine).

Once you have done this you should see a single window. This is called the console. The console is where you go to actually run lines of code. The other major way in which you will program in R is by writing code in a separate file called a script. Create a new script by going to File> New script. An empty window pops up, in which you can also type code. Try typing 1+2 in this window and pressing return. Notice that no output is produced - the cursor just moves to the next line. This is because a script is fundamentally different from the console and in fact works just like any other text editor. In order to run the code that we have written in a script we need to select the line(s) that we want to run and go to Edit>Run line or selection. This copies the selected line(s) over to the console and evaluates them in the order they are written. In this way we can create a long sequence of commands (i.e. a program) in a way that would not be possible by working directly in the console. In general you should work mainly with scripts and only use the console for small tasks like checking that your script is working as planned.

!Tip! - To run an entire script, first select all with the keyboard shortcut Ctrl+a, then run selected lines with the shortcut Ctrl+r (Windows only). This also works for just a single selected line.

We strongly suggest that you write anything you want to keep in scripts and that you save these scripts in your home directory or on a USB stick. (Scripts are just text files; most people use up using other text editors, such as SublimeText, TextWrangler, or they run R using RStudio; all these options make the code prettier and easier to read.).

It is also worth keeping in mind that the R help is extremely good. Just put a question mark before any function that you do not understand (e.g. ?length) to bring up the help file for that function. There are also many R websites and forums that you may find useful. The best way to learn any programming language is to fiddle - so please fiddle away with these tools to guide you!

## Variables
A variable is a symbolic way of storing a particular set of values and/or characters. For example, try typing
```
x <- 5
```
into the console and hitting return. This assigns the number `5` to the symbol `x`. You can run operations on variables (e.g. `3*x^2`), create new variables from existing variables (e.g. `y <- 3*x^2`), and reassign existing variables to a new value (e.g.` x <- 3*x^2`).

### A note on assigning variables:
The `=` symbol can also be used for assignment instead of `<-`, but this is frowned upon by most R users (it makes your code less readable). Thus please try to use `<-` . When in doubt about how to write something, check Google’s R style guide; it provides standard guidelines which most R users follow.

It’s worth pointing out that you can name variables almost anything you want. Try using descriptive names (avoiding  x and y), but don’t make the it too long! As a rule of thumb, remember to make your code easily understandable for other people, including your future self.

Finally some variable names are not allowed. Typing `?make.names` in the console brings up a help file describing the important variable name restrictions.

## Data classes
There are several classes of data.  In simple terms, the class of your data tells you whether R interprets the data as numbers, letters, factors, logical values or a number of alternatives. You can use the function `class()` to check the class of a variable.

You will probably have met variables of class numeric (`x <- 5`) and character (`x <- ‘hello’`). An important class of data that you might not be familiar with is logical data. Simply put, logical data can only take one of two possible values: `TRUE` or `FALSE`. There are a number of different ways of arriving at a logical variable. The most obvious is to simply define a variable as true, for example
```
x <- TRUE
```
or false, for example
```
x <- FALSE
```

Try creating a logical variable in this way and look at the class of the variable - if you have done it correctly it should read "logical"(keep in mind that R is case-sensitive, i.e. x <- false will throw an error). However, this is not the way that logical variables tend to be used in programming. More often than not we arrive at a logical variable through a particular type of calculation, called a logical expression. You can think of a logical expression as a statement that we send to R, which may be a true statement, or it may be a lie! For example, try evaluating the code

```
5 > 4
```

This statement is clearly true and accordingly R returns a value "TRUE". The statement
```
5 < 4
```
on the other hand, returns the value "FALSE". We can assign this logical value to a variable by using the logical expression as input to the variable. This sounds complicated, but in practice it is very simple. Take the example
```
x <- (5 > 4)
```
You can read this to mean "the variable x is assigned the outcome of the logical expression 5 > 4". In this particular example the variable x will be assigned the logical value "TRUE". Notice that the logical expression itself has been placed within parentheses. This is not strictly required, but is good coding practice as it avoids confusion between the assignment symbol and the logical expression.

The main logical operators that you should be familiar with are the following:
*`>`      is greater than
*`<`     is less than
*`>=`   is greater than or equal to
*`<=`   is less than or equal to
*`==`   is equal to
*`!=`   is not equal to

Have a play around with some of these operators in your own made-up logical expressions. Make sure you are comfortable assigning a logical value to a variable.

We can create more sophisticated logical expressions using the "and" command and the "or" command. The "and" command is written `&` (keyboard shortcut Shift+7), while the "or" command is written `|` (keyboard shortcut Shift+\ on a standard Windows keyboard). These operators can be placed between two or more logical expressions - exactly as you would do in a spoken sentence. For example, the expression
```
(x > 5) & (x <= 10)
```
can be read "x is greater than five, and x is less than or equal to ten". Similarly, the expression
```
(x < 6) | (x == 12)
```
can be read "x is less than six, or x is equal to twelve". By using a combination of these operators, while making good use of parentheses, it is possible to come up with some quite complex statements.

## Types of Objects
### Scalars and vectors
Objects can be of different types. So far, we have looked at scalar objects, which contain a single variable (e.g. x <- 3). Another very common type of object is the vector, which is an object containing several elements:
```
vec1 <- c(1, 1, 2, 3, 5, 8)
vec2 <- 5:10
vec3 <- seq(0, 10, 0.25)
vec4 <- rep(2, 12)
vec5 <- c("How", "Now", "Brown", "Cow")
vec6 <- c(TRUE, TRUE, FALSE, TRUE, TRUE, FALSE)
```
As you know by now, R is good at manipulating these vectors, with easy ways of accessing individual elements of a vector (e.g. `x[3]`) and of applying simple operations on all elements of the vector (e.g. `vec1*3` or `vec1*vec2`). Remember that, for some calculations between different vectors, the vectors need to be compatible. This generally means they have lengths that are multiple of each other. Note that in R, the first position of a vector has the index 1, unlike in some other programming languages where the first position has the index 0.

### Matrices
Another major type of object in R is the matrix. A matrix is simply a rectangular grid of values. One of the simplest ways of producing a matrix is by combining several vectors through the functions `rbind()` and `cbind()` (try `rbind(vec1, vec2)`).

You can also create matrices directly in a number of different ways:
```
mat1 <- matrix(1:24, nrow=6, ncol=4)
mat2 <- matrix(1:24, nrow=6, ncol=4, byrow=T)
mat3 <- diag(x=5)
mat4 <- outer(X=1:5, Y=4:8)
mat5 <- matrix("Hello World", nrow=2, ncol=5)
```
As with vectors, you can get to the elements of a matrix using square brackets, but with  a two-dimensional index! (`mat1[4,3]`, `mat1[1:4, 1:2]`, `mat1[1:3,]`). You can perform simple calculations on matrices, in which case the calculation applies to each element separately (`(mat3 + 2)*2` ). You can also combine the values in several matrices, as long as the dimensions of the matrices are compatible (`(mat3*100) + mat4)`. Finally, you can create logical expressions that apply to an entire matrix. For example, try evaluating `(mat1 > 10)`.

### Data frame
A very common type of object is the data frame. On the face of it, these look very similar to matrices. However, there are some important differences between data frames and matrices. The most important difference is that, in a matrix, all the elements need to be of the same class, while in a data frame, different classes are allowed. Several data frames are  loaded into R by default (`puromycin.data <- Puromycin`). Like in matrices, you can access different elements of the data frame using indices (`puromycin.data[1,1]`). While you can get to specific columns using an index (`puromycin.data[,2]`), R allows you to get to specific columns using their name and the dollar sign: `puromycin.data$rate`. Note that, although the data frame is of class data frame, typing `puromycin.data$rate` will return a vector of class numeric (try using the function `class()` to check this).

Normally, when R encounters columns with words in a data frame (rather than numbers), it automatically interprets them as data of a different type, the factor. This allows us to work with categorical data, by organising the data into discrete categories, known as levels (e.g., red, yellow and blue could be the levels of a column called ‘colour’). Check `puromycin.data$rate` as an example.

### Lists
The last data type that is commonly seen in R is the list. A list is a bit like a complicated vector, where the elements can be objects of any type. For example, we can make a list of vectors:
```
mylist <- list(A = c(1,2,3), B=c(5,6,7,8,9,10), D=c('G', 'H'))
```
Again, we can access elements from the list using their index. However, using a single bracket `[]` will return a list (`mylist[1]`), while using the double bracket will return an object of the same type as the element of the list (`mylist[[1]]` will return a vector of numeric elements). We can get specific elements by their names using the bracket notation (`mylist[['A']]`) or the dollar sign (`mylist$A`). Lists can get very complex, since there is no limits on the data type of the elements. Therefore, you can get lists of vectors, lists of lists, lists of vectors and lists, etc…

There are other types of data in R, with many being specific to particular libraries.

## Subsetting a data frame
We have already come across one way of subsetting through the use of square brackets. By typing, for example,
```
puromycin.data <- Puromycin
puromycin.data[1:3, ]
```
we can isolate certain rows of the data frame that we are interested in.
We can isolate data easily by using the logical statements mentioned above. For example, we can check which rows have a rate that is less than 100:
```
#returns TRUE or FALSE
puromycin.data[puromycin.data$rate < 100, ]
#returns which elements are TRUE
which(puromycin.data$rate < 100)
```
We can use the index to select the rows for which the statement is TRUE:
```
#returns all the columns, but only the rows for which #puromycin.data$rate < 100 is TRUE
subdata <- puromycin.data[puromycin.data$rate < 100, ]
```

When subsetting data frames, we can also use the subset function, which has a more clear syntax, as the $ is not necessary:
```
subdata <- subset(puromycin.data, rate < 100)
```

We could subset by the state column:
```
## First alternative
subdata <- puromycin.data[puromycin.data$state == "treated", ]
## Second alternative
subdata <- subset(puromycin.data, state == "treated")
```

This will return all fields for which the state is equal to "treated". Notice that the factor must be written in quotation marks here, as R needs to know that it is looking for a particular set of characters, rather than a variable.

## Data input from files
Open source data plays an increasingly important role recently, so it is vital to know how to input the data with various formats into your program. Choosing the right way of importing data will save you time and boost your efficiency when cleaning the data. To test your abilities, download river.csv and kaiser.xls and try loading them into R.
```
river.data  <- read.csv(“river.csv”)      # if you’re in the right directory
river.data  <- read.csv(file.choose())    # to choose the file
kaiser.data <- read.xls(“kaiser.xls”, sheet=1)
# try to figure out how to import Excel spreadsheets into R,
# which is an excessively discussed topic online
```

## Setting the working directory
Setting directory is a highly intensely used function which helps group your code and your data, and access to different paths. For example, if you want to save a series of graphs that were generated by accessing data outside the current folder in a loop, it saves you time by grouping data for you.
```
# set the working directory
setwd(“C:/Users/Public/Documents”)   # or use the equivalent menu options
# get all the file names in the current directory
list.files(path=".")
# get the current working directory
getwd()
```

## Data output into various formats
Most of the time, as either a data recorder or a data analyst, knowing the best way to output data is important. The reason to export data into various formats is to make work easier when switching data analysis software (e.g. from R to Excel and back).
```
# write a new subsetted data frame (create this using your previous skills) into a CSV file
write.csv(my.river.subset, file = “myRiverSubset.csv”)
# import this into Excel
# create three variables, a, b, and c of any class and save them into a .Rdata file (What is this? When could it be useful?)
save(a, b, c, file=”nodeProperty.Rdata”)
```

## Good coding practice
Keep your code clean and tidy by making use of comments and white space and respecting the style guide.  Comments start with the character # (R simply does not interpret anything written between a comment sign and the end of the line. They  allow you to annotate your code, i.e. to write helpful notes in between all the raw program code. Notice also that white space such as empty lines, spaces and indentations (obtained by pressing the Tab key) are invisible to R. Making good use of white space helps keep your code readable, and so does using clear and descriptive variable names.

The following two examples make this point clear. Both programs do exactly the same thing, but one will make sense one year from now, and the other will not!
```
Example 1
boooom <-0.01
blah2          =0.005
    blah3<- 0.0036
bigblah                           = boooom+ blah2        + blah3
tadayeahmanfunky<-100*exp(bigblah*10)
tadayeahmanfunky

Example 2

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
temp          <- 0.005
humidity      <- 0.0036
starting.size <- 100
grow.time     <- 10

# Calculate total growth rate
growth.rate <- nutrients+temp+humidity

# Calculate population size at the end of the time period
end.size <- starting.size * exp( growth.rate*grow.time )

# Return end population size in the console
end.size
#--------------------------------
