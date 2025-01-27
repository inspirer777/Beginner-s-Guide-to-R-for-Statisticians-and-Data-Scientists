
#Lecture 1 Mabahes in R
#26-11-99



###################
#R as a calculator
##############################

#You can use R has a high-powered calculator. For example,

1 + 2
## [1] 3

456 * 7
## [1] 3192

5 / 2
## [1] 2.5


#Notice that the command 5/2 gave the result 2.5, while several other programming 
#languages would typically give 2 as a result.

#There are several math functions which come with R. For example, to evaluate log(e25???2sin(??)), we would type

log(exp(25) - 2^(sin(pi)))
## [1] 25

######################
#Types of variables
#####################

#Common types
#integer (., -1, 0, 1, 2, .)
#double or Numeric (real numbers),
#character/string ("a", "R is cool", "the quick brown fox.", "1")
#Boolean/logical (TRUE or FALSE)
#############################################
#double or Numeric (real numbers),
x<-4
is.numeric(x)
is.numeric(4)
#integer (., -1, 0, 1, 2, .)
y<-4L
is.integer(y)
is.numeric(y)
is.integer(4L)
#integer--->>>numeric
object.size(c(1L,2L,3L))
object.size(c(1,2,3))

#complex
z<-1+3i
z
is.complex(z)
#character/string ("a", "R is cool", "the quick brown fox.", "1")

x<-"data"
h<-"Data"
x
class(x)
class(y)
nchar(x)
nchar("Statistics")
#Boolean/logical (TRUE or FALSE)
TRUE*5
FALSE*5
F*5
T*4
!TRUE=FALSE
!FALSE=TRUE
#&  alamat Va
#|  alamat ya
# && va baray anasor
# || ya baray anasor
# <
# <=  
# >=  bozgtar  va mosavi
# ==
# !=  mosavi nistand
2 < 5
7!= 10
  class(T)
  is.logical(TRUE)
  as.integer(TRUE)
#Apart from numbers, R supports a number of different "types" of variables. 
#The most commonly used ones are numeric variables, character variables (i.e. strings), factor variables, 
#and boolean (or logical) variables.

#We can check the type of a variable by using the typeof function:

typeof("1")
## [1] "character"

typeof(TRUE)
## [1] "logical"

#We can change the type of a variable to type x using the function as.x. 
#This process is called "coercion". For example, the following code changes the number 6507232300 to
#the string "6507232300":

as.character(6507232300)
## [1] "6507232300"

typeof(6507232300)
## [1] "double"

typeof(as.character(6507232300))
## [1] "character"

#We can also change variables to numbers or boolean variables.

as.numeric("123")
## [1] 123

as.logical(123)
## [1] TRUE

as.logical(0)
## [1] FALSE

#Sometimes type conversion might not work:

as.numeric("def")
## Warning: NAs introduced by coercion
## [1] NA

#Sometimes type conversion does not work as you might expect. Always check that the result is what you want!

as.logical("123")
## [1] NA

#Variable assignment
#Often, we want to store the result of a computation so that we can use it later.
#R allows us to do this by variable assignment. Variable names must start with a letter
#and can only contain letters, numbers, _ and ..

#The following code assigns the value 2 to the variable x:

x <- 2
#Do not use the = sign to assign values to variables! Although it works in R, it can cause a lot of confusion.

#Notice that no output was printed. This is because the act of variable assignment doesn't produce
#any output. If we want to see what x contains, simply key its name into the console:

x
## [1] 2
#For more complex objects that will encounter soon, we can use the str function to get information
#on the internal structure of the object:

str(x)
##  num 2
#We can use x in computations:

x^2 + 3*x
## [1] 10
#We can also reassign x to a different value:

x <- x^2
x
## [1] 4
#What is the value of x and y after I execute the following code?

y <- x
x <- x^2
#Let's add a third variable:

z <- 3
#Note that we now have 3 entries in our Environment tab. To remove an object/variable, use the rm() function:

rm(x)
#To remove more than one object, separate them by commas:

rm(y, z)
#Let's add the 3 variables back again:

x <- 1; y <- 2; z <- 3
#To remove all objects at once, use the following code:

rm(list = ls()) 


##################
#1
#Vectors
#############

#For data analysis, we often have to work with multiple values at the same time.
#There are a number of different R objects which allow us to do this.

#The vector is a 1-dimensional array whose entries are the same type. 
#For example, the following code produces a vector containing the numbers 1,2 and 3:
  
  vec <- c("a", "b", "c")
vec
## [1] "a" "b" "c"


#Typing out all the elements can be tedious. Sometimes there are shortcuts we can use.
#The following code assigns a vector of the numbers 1 to 100 to vec:
  
  vec <- 1:100
vec
##   [1]   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17
##  [18]  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34
##  [35]  35  36  37  38  39  40  41  42  43  44  45  46  47  48  49  50  51
##  [52]  52  53  54  55  56  57  58  59  60  61  62  63  64  65  66  67  68
##  [69]  69  70  71  72  73  74  75  76  77  78  79  80  81  82  83  84  85
##  [86]  86  87  88  89  90  91  92  93  94  95  96  97  98  99 100

#What if I only want even numbers from 1 to 100 (inclusive)? We can manipulate vectors using
#arithmetic operations (just like numbers). Note that arithmetic operations happen element-wise.

even <- 1:50 * 2
even
##  [1]   2   4   6   8  10  12  14  16  18  20  22  24  26  28  30  32  34
## [18]  36  38  40  42  44  46  48  50  52  54  56  58  60  62  64  66  68
## [35]  70  72  74  76  78  80  82  84  86  88  90  92  94  96  98 100

#We can also get the odd numbers:
  
  odd <- even - 1

  #We can use the c() function to combine ("concatenate") several small vectors into one large vector.
  #How many elements does the vector z have?

z <- 1:5
z <- c(z, 3, z)

#R allows us to access individual elements in a vector. Unlike many other programming languages, 
#indexing begins at 1, not 0. For example, to return the first even number, I would use the following code:
  
  even[1]
## [1] 2

  #We can get multiple elements of a vector as well. The following code extracts the 3rd to 7th even
  #number (inclusive), and assigns it to the variable y:
  
  y <- even[3:7]
y
## [1]  6  8 10 12 14

#This extracts just the 3rd and 5th even numbers:
  
  even[c(3,5)]
## [1]  6 10

  #What if I want all even numbers except the first two? I can use negative indexing to achieve my goal:
  
  even[-c(1,2)]
##  [1]   6   8  10  12  14  16  18  20  22  24  26  28  30  32  34  36  38
## [18]  40  42  44  46  48  50  52  54  56  58  60  62  64  66  68  70  72
## [35]  74  76  78  80  82  84  86  88  90  92  94  96  98 100

  #Use the length function to figure out how many elements there are in a vector.
  #What happens if I try to extract an element from an index greater than its length?

length(odd)
## [1] 50
odd[51]
## [1] NA

#One last note about vectors: the elements in a vector have to be of the same type.
#How do you think R gets the results for the code below?

c(1, 2, "a")
## [1] "1" "2" "a"

############################
#Example: Working with mathematics
###########################

# suppose the yearly number of whales beached in Texas during the period 1990 to 1999 is

#        74 122 235 111 292 111 211 133 156 79

#What is the mean, the variance, the standard deviation? Again, R makes these easy to answer:
  
 whale = c(74, 122, 235, 111, 292, 111, 211, 133, 156, 79)

 mean(whale)
##[1] 152.4
 var(whale)
##[1] 5113.378
 std(whale)
##Error: couldn't find function "std"
 sqrt(var(whale))
##[1] 71.50789
sqrt( sum( (whale - mean(whale))^2 /(length(whale)-1)))
##[1] 71.50789

#Well, almost! First, one needs to remember the names of the functions. 
#In this case mean is easy to guess, var is kind of obvious but less so, std is also kind of obvious, 
#but guess what? It is not 
#there! So some other things were tried. First, we remember that the standard deviation
#is the square of the variance. Finally, the last line illustrates that R can almost
#exactly mimic the mathematical formula for the standard deviation:

#Since this example is so easy, lets see how it is done:
  
std = function(x) sqrt(var(x)) 
 std(whale)
##[1] 71.50789
 

#Finally, if we had thought a little harder we might have found the actual built-in sd() command. Which gives

sd(whale)
##[1] 71.50789 

#######################
#R Basics: Accessing Data
##############################

#There are several ways to extract data from a vector. Here is a summary using both
#slicing and extraction by a logical vector. Suppose x is the data vector, 

#for example
x=1:10

#how many elements?
length(x)

#ith element
x[2] #(i=2)

#all but ith element
x[-2] #(i=2)

#first k elements
x[1:5] #(k=5)

#last k elements
x[(length(x)-5):length(x)] #(k=5)

#specific elements.
x[c(1,3,5)] #(First, 3rd and 5th)

#all greater than some value
x[x>3] #(the value is 3)

#bigger than or less than some values
x[ x< -2 | x > 2]

#which indices are largest
which(x == max(x))

######################
#2
#Matrices and arrays
#######################

#Matrices are just the 2-dimensional analogs of vectors while arrays are the n-dimensional analogs of vectors. 
#We won't be talking about them a whole lot in this class. As with vectors, elements of matrices and arrays have to be of the same type.

#Use the matrix() command to change a vector into a matrix:
  
  A <- matrix(1:12, nrow = 3)
A
##      [,1] [,2] [,3] [,4]
## [1,]    1    4    7   10
## [2,]    2    5    8   11
## [3,]    3    6    9   12

#To get the dimensions of the matrix, we can use the dim, nrow and ncol functions:
  
  dim(A)
## [1] 3 4
nrow(A)
## [1] 3
ncol(A)
## [1] 4


#To access the element in the ith row and j column for the matrix A, use the index i,j:
  
  A[1, 2]  # for the element in the 1st row and 2nd column
## [1] 4

  #What do you think A[2,] returns? how about A[,2]? And A[c(1, 3), c(2,4)]?

####################### 
#3
#Lists
#######################
#  In all the data structures so far, the elements have to be of the same type.
  #To have elements on different types in one data structure, we can use a list, 
  #which we create with list(). We can think of a list as a collection of key-value pairs. Keys should be strings.

person <- list(name = "John Doe", age = 26)
person
## $name
## [1] "John Doe"
## 
## $age
## [1] 26


#The str function can be used to inspect what is inside person:
  
  str(person)
## List of 2
##  $ name: chr "John Doe"
##  $ age : num 26
  
#To access the name element person, we have 2 options:
  
  person[["name"]]
## [1] "John Doe"
person$name
## [1] "John Doe"

#The elements of a list can be anything, even another data structure! Let's add the names of John's
#children to the person object:
  
  person$children <- c("Ross", "Robert")
str(person)
## List of 3
##  $ name    : chr "John Doe"
##  $ age     : num 26
##  $ children: chr [1:2] "Ross" "Robert"

#To see the keys associated with a list, use the names() function:
  
  names(person)
## [1] "name"     "age"      "children"
  
  
######################  
#4
#  Data frames
#####################  
  
#Packages not only give us access to user-created functions, but also user-created datasets. 
#  In R, datasets are called data frames.
  
#Let's load the fueleconomy package (if you haven't install this package yet, 
# run this command first: install.packages("fueleconomy")):
    
    library(fueleconomy)


#  Load the vehicles dataset with the data function (to find out more about the vehicles dataset, key in ?vehicles):
    
    data(vehicles)
    
#  An entry vehicles pops up in the Environment tab. 
    #We can see that the dataset has ~33,000 observations with 12 variables.
  
#  Let's view the data with the View() function (note the capital V). 
    #(Alternatively, we can click on "the"vehicles in the Environment tab.) 
#  A new tab pops up in the top-left pane displaying the data.
    #Clicking on the column names allows us to sort the data.
    View(vehicles)
    
#  (Note: Some of you might not be able to click on "fueleconomy" in the Environment tab right away.
    #Don't worry about it, typing View(fueleconomy) into the console will still work,
    #and you should be able to click on "fueleconomy" after that.)
  
  #Seeing parts of the data 33,000 observations is a lot of observations to look through.
    #Instead of looking through all of it, we can use various functions to give us a feel for the data.
  #Use the head and tail functions to display the first few or last few rows of the dataset.
  #To control the number of lines shown (default is 6), use the optional n argument.
  
  head(vehicles)
  
  ##      id       make               model year                       class
  ## 1 27550 AM General   DJ Po Vehicle 2WD 1984 Special Purpose Vehicle 2WD
  ## 2 28426 AM General   DJ Po Vehicle 2WD 1984 Special Purpose Vehicle 2WD
  ## 3 27549 AM General    FJ8c Post Office 1984 Special Purpose Vehicle 2WD
  ## 4 28425 AM General    FJ8c Post Office 1984 Special Purpose Vehicle 2WD
  ## 5  1032 AM General Post Office DJ5 2WD 1985 Special Purpose Vehicle 2WD
  ## 6  1033 AM General Post Office DJ8 2WD 1985 Special Purpose Vehicle 2WD
  ##             trans            drive cyl displ    fuel hwy cty
  ## 1 Automatic 3-spd    2-Wheel Drive   4   2.5 Regular  17  18
  ## 2 Automatic 3-spd    2-Wheel Drive   4   2.5 Regular  17  18
  ## 3 Automatic 3-spd    2-Wheel Drive   6   4.2 Regular  13  13
  ## 4 Automatic 3-spd    2-Wheel Drive   6   4.2 Regular  13  13
  ## 5 Automatic 3-spd Rear-Wheel Drive   4   2.5 Regular  17  16
  ## 6 Automatic 3-spd Rear-Wheel Drive   6   4.2 Regular  13  13
  
  
  tail(vehicles, n = 2)
  
  ##          id  make                       model year       class
  ## 33441 33306 smart fortwo electric drive coupe 2013 Two Seaters
  ## 33442 34394 smart fortwo electric drive coupe 2014 Two Seaters
  ##                trans            drive cyl displ        fuel hwy cty
  ## 33441 Automatic (A1) Rear-Wheel Drive  NA    NA Electricity  93 122
  ## 33442 Automatic (A1) Rear-Wheel Drive  NA    NA Electricity  93 122
  
 # Under the hood, data frames are implemented as lists, with each column being one element in the list.
 # Hence, whatever we can do with lists, we can do with data frames. For example,
  #we can get the data frame's column names using name():
    
  names(vehicles)
  
  ##  [1] "id"    "make"  "model" "year"  "class" "trans" "drive" "cyl"  
  ##  [9] "displ" "fuel"  "hwy"   "cty"
    
  vehicles$class[1:10]
  
  ##  [1] "Special Purpose Vehicle 2WD" "Special Purpose Vehicle 2WD"
  ##  [3] "Special Purpose Vehicle 2WD" "Special Purpose Vehicle 2WD"
  ##  [5] "Special Purpose Vehicle 2WD" "Special Purpose Vehicle 2WD"
  ##  [7] "Midsize Cars"                "Subcompact Cars"            
  ##  [9] "Subcompact Cars"             "Subcompact Cars"
  
 # Since the number of columns in a data frame is just the number of elements in a list,
  #we can get the number of columns using length():
    
 length(vehicles)
  ## [1] 12
 
 # We can also use the ncol() and nrow() functions to get the number of columns and rows of the data frame:
    
    ncol(vehicles)
  ## [1] 12
  nrow(vehicles)
  ## [1] 33442
  
  
 # Interestingly, data frames can act a little like matrices too.
  #For example, we can use dim() to figure out the number of rows and columns in the data frame:
    
    dim(vehicles)
  ## [1] 33442    12
    
 # To access the 30th row, we can type
  
  vehicles[30, ]
  ##       id  make model year        class          trans             drive
  ## 30 16734 Acura 3.2TL 2001 Midsize Cars Automatic (S5) Front-Wheel Drive
  ##    cyl displ    fuel hwy cty
  ## 30   6   3.2 Premium  27  17
  
  #Getting an overview of the data
  #For an overview of the entire data set, the str function we introduced last session is very handy.
  #For each column, str tells us what type of variable it is, as well as the first couple of values for the column.
  
  str(vehicles)
  ## Classes 'tbl_df', 'tbl' and 'data.frame':    33442 obs. of  12 variables:
  ##  $ id   : int  27550 28426 27549 28425 1032 1033 3347 13309 13310 13311 ...
  ##  $ make : chr  "AM General" "AM General" "AM General" "AM General" ...
  ##  $ model: chr  "DJ Po Vehicle 2WD" "DJ Po Vehicle 2WD" "FJ8c Post Office" "FJ8c Post Office" ...
  ##  $ year : int  1984 1984 1984 1984 1985 1985 1987 1997 1997 1997 ...
  ##  $ class: chr  "Special Purpose Vehicle 2WD" "Special Purpose Vehicle 2WD" "Special Purpose Vehicle 2WD" "Special Purpose Vehicle 2WD" ...
  ##  $ trans: chr  "Automatic 3-spd" "Automatic 3-spd" "Automatic 3-spd" "Automatic 3-spd" ...
  ##  $ drive: chr  "2-Wheel Drive" "2-Wheel Drive" "2-Wheel Drive" "2-Wheel Drive" ...
  ##  $ cyl  : int  4 4 6 6 4 6 6 4 4 6 ...
  ##  $ displ: num  2.5 2.5 4.2 4.2 2.5 4.2 3.8 2.2 2.2 3 ...
  ##  $ fuel : chr  "Regular" "Regular" "Regular" "Regular" ...
  ##  $ hwy  : int  17 17 13 13 17 13 21 26 28 26 ...
  ##  $ cty  : int  18 18 13 13 16 13 14 20 22 18 ...
  
  
 # The summary function gives us some useful statistics for each variable:
    
    summary(vehicles)
  ##        id            make              model                year     
  ##  Min.   :    1   Length:33442       Length:33442       Min.   :1984  
  ##  1st Qu.: 8361   Class :character   Class :character   1st Qu.:1991  
  ##  Median :16724   Mode  :character   Mode  :character   Median :1999  
  ##  Mean   :17038                                         Mean   :1999  
  ##  3rd Qu.:25265                                         3rd Qu.:2008  
  ##  Max.   :34932                                         Max.   :2015  
  ##                                                                      
  ##     class              trans              drive                cyl        
  ##  Length:33442       Length:33442       Length:33442       Min.   : 2.000  
  ##  Class :character   Class :character   Class :character   1st Qu.: 4.000  
  ##  Mode  :character   Mode  :character   Mode  :character   Median : 6.000  
  ##                                                           Mean   : 5.772  
  ##                                                           3rd Qu.: 6.000  
  ##                                                           Max.   :16.000  
  ##                                                           NA's   :58      
  ##      displ           fuel                hwy              cty        
  ##  Min.   :0.000   Length:33442       Min.   :  9.00   Min.   :  6.00  
  ##  1st Qu.:2.300   Class :character   1st Qu.: 19.00   1st Qu.: 15.00  
  ##  Median :3.000   Mode  :character   Median : 23.00   Median : 17.00  
  ##  Mean   :3.353                      Mean   : 23.55   Mean   : 17.49  
  ##  3rd Qu.:4.300                      3rd Qu.: 27.00   3rd Qu.: 20.00  
  ##  Max.   :8.400                      Max.   :109.00   Max.   :138.00  
  ##  NA's   :57
    
#  We can also do summaries on just one column:
    
    summary(vehicles$hwy)
  ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  ##    9.00   19.00   23.00   23.55   27.00  109.00
    
 # For just the mean or median, use the mean and median functions on the column of interest:
    
    mean(vehicles$hwy)
  ## [1] 23.55128
  median(vehicles$hwy)
  ## [1] 23
  
#  The sd() and var() functions compute the standard deviation and variance of a vector for us:
    
    sd(vehicles$hwy)
  ## [1] 6.211417
  var(vehicles$hwy)
  ## [1] 38.5817
  
 # Note that the default types for the variables don't always make sense. For example, does it make sense to take the mean of id numbers? To change the type of a column, use the as.x function (where x is the type you want to change to):
    
    vehicles$id <- as.character(vehicles$id)
  str(vehicles)
  ## Classes 'tbl_df', 'tbl' and 'data.frame':    33442 obs. of  12 variables:
  ##  $ id   : chr  "27550" "28426" "27549" "28425" ...
  ##  $ make : chr  "AM General" "AM General" "AM General" "AM General" ...
  ##  $ model: chr  "DJ Po Vehicle 2WD" "DJ Po Vehicle 2WD" "FJ8c Post Office" "FJ8c Post Office" ...
  ##  $ year : int  1984 1984 1984 1984 1985 1985 1987 1997 1997 1997 ...
  ##  $ class: chr  "Special Purpose Vehicle 2WD" "Special Purpose Vehicle 2WD" "Special Purpose Vehicle 2WD" "Special Purpose Vehicle 2WD" ...
  ##  $ trans: chr  "Automatic 3-spd" "Automatic 3-spd" "Automatic 3-spd" "Automatic 3-spd" ...
  ##  $ drive: chr  "2-Wheel Drive" "2-Wheel Drive" "2-Wheel Drive" "2-Wheel Drive" ...
  ##  $ cyl  : int  4 4 6 6 4 6 6 4 4 6 ...
  ##  $ displ: num  2.5 2.5 4.2 4.2 2.5 4.2 3.8 2.2 2.2 3 ...
  ##  $ fuel : chr  "Regular" "Regular" "Regular" "Regular" ...
  ##  $ hwy  : int  17 17 13 13 17 13 21 26 28 26 ...
  ##  $ cty  : int  18 18 13 13 16 13 14 20 22 18 ...
  
  
### ##########################
  #Factors
################################
 # Look at the output of summary(vehicles) again. 
  #Note that for all the character variables, summary() doesn't give us any information on them.
  #One way to get information on character variables is to use the table() function:
    
    table(vehicles$drive)
  ## 
  ##              2-Wheel Drive              4-Wheel Drive 
  ##                        507                        699 
  ## 4-Wheel or All-Wheel Drive            All-Wheel Drive 
  ##                       6647                       1267 
  ##          Front-Wheel Drive    Part-time 4-Wheel Drive 
  ##                      12233                         96 
  ##           Rear-Wheel Drive 
  ##                      11993
  
  
#  Another way we can get information on character variables is by converting them to factors. 
#  Factors represent categorical variables: i.e. values fall into one of several categories (e.g. gender, age group).
#  Categories can be unordered (e.g. gender, we call them nominal variables), or ordered (e.g. age group, we call them 
  #ordinal variables).
  
#  We can make a character variable into a factor variable by using factor(). Notice now that summary() 
  #gives more useful information. (By default, factor variables are nominal variables.)
  
  vehicles$drive <- factor(vehicles$drive)
  summary(vehicles$drive)
  
  ##              2-Wheel Drive              4-Wheel Drive 
  ##                        507                        699 
  ## 4-Wheel or All-Wheel Drive            All-Wheel Drive 
  ##                       6647                       1267 
  ##          Front-Wheel Drive    Part-time 4-Wheel Drive 
  ##                      12233                         96 
  ##           Rear-Wheel Drive 
  ##                      11993
  
#  Let's look at the internal structure of the factor variable:
    
    str(vehicles$drive)
    
  ##  Factor w/ 7 levels "2-Wheel Drive",..: 1 1 1 1 7 7 7 5 5 5 ...

#Notice that the words ("2 Wheel Drive", etc.) have been changed into numbers! That's because R assigns 
    #each category a number. We can see this assignment somewhat by calling levels(),
   # which shows us the "levels", or categories, for this variable:
    
    levels(vehicles$drive)
    
  ## [1] "2-Wheel Drive"              "4-Wheel Drive"             
  ## [3] "4-Wheel or All-Wheel Drive" "All-Wheel Drive"           
  ## [5] "Front-Wheel Drive"          "Part-time 4-Wheel Drive"   
  ## [7] "Rear-Wheel Drive"
 
# So 2-Wheel Drives are labeled 1, and so on. By default, R assigns this internal labeling by alphabetical order. 
 #   This internal labeling is usually not a concern to us. See optional material section for more details.

## ###################  
 # Working with NAs
##########################
    
#Let's compute the mean number of cylinders in our dataset:
    
    mean(vehicles$cyl)
  ## [1] NA
    
# Hmm, we get an NA? What's happening? If we look through the cyl column, you'll find 
    #that some of the entries are NA. Look at the documentation for the mean function and you'll see that
    #there is an na.rm option, with default value FALSE. This means that by default, mean will not remove
    #any NAs that it sees, and will return NA if any one of the elements is NA.
  
 # We can get the mean as follows:
    
    mean(vehicles$cyl, na.rm = TRUE)
  ## [1] 5.771867
    
# Working with NAs can be tricky sometimes because they don't always show up.
# For example, the output of table doesn't show you the NAs, which could mislead you into thinking 
    #that there are no NAs in the column:
    
    table(vehicles$cyl)
  ## 
  ##     2     3     4     5     6     8    10    12    16 
  ##    45   182 12381   718 11885  7550   138   478     7
    
 # The summary function does tell us though if there are NAs in a column:
    
    summary(vehicles$cyl)
  ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
  ##   2.000   4.000   6.000   5.772   6.000  16.000      58
 
    # To test if something is an NA or not, use the is.na function.
  
  is.na(NA)
  ## [1] TRUE
  
#############################
 # Optional material
##########################  
 # Computing the mode of a column
 # R doesn't have a built-in function to compute the mode. We can either write our own function 
  #(a number of people have done that, do a google search), or we can use some other functions which allow
  #us to figure out what the mode is.
  
  #First, the table function tells us how many times each value appeared in the column:
    
    table(vehicles$hwy)
  ## 
  ##    9   10   11   12   13   14   15   16   17   18   19   20   21   22   23 
  ##   13   66   62  275  295  453  847 1257 2094 1547 1605 2314 1400 2672 2383 
  ##   24   25   26   27   28   29   30   31   32   33   34   35   36   37   38 
  ## 2788 1944 2712 1558 1448 1371  846  799  528  515  358  313  205  125  106 
  ##   39   40   41   42   43   44   45   46   47   48   49   50   51   52   53 
  ##  125   79   56   46   20   52   55    9   10    8   14    2    4    7    1 
  ##   54   58   59   60   61   62   64   65   68   69   74   79   90   92   93 
  ##    3    4    2    1    1    2    3    2    2    2    3    2    3    2    4 
  ##   96   97   99  101  102  105  108  109 
  ##    2    2    6    2    1    3    2    1
  
 # To find out which number appeared most often, we have to visually scan the whole table.
 # We could sort the table to help us:
    
    sort(table(vehicles$hwy))
  ## 
  ##   53   60   61  102  109   50   59   62   65   68   69   79   92   96   97 
  ##    1    1    1    1    1    2    2    2    2    2    2    2    2    2    2 
  ##  101  108   54   64   74   90  105   51   58   93   99   52   48   46   47 
  ##    2    2    3    3    3    3    3    4    4    4    6    7    8    9   10 
  ##    9   49   43   42   44   45   41   11   10   40   38   37   39   36   12 
  ##   13   14   20   46   52   55   56   62   66   79  106  125  125  205  275 
  ##   13   35   34   14   33   32   31   30   15   16   29   21   28   18   27 
  ##  295  313  358  453  515  528  799  846  847 1257 1371 1400 1448 1547 1558 
  ##   19   25   17   20   23   22   26   24 
  ## 1605 1944 2094 2314 2383 2672 2712 2788
    
  #The mode is the last entry (24, appearing 2788 times). To have the mode appear in front, 
    #adding a decreasing = TRUE argument to the function call:
    
    sort(table(vehicles$hwy), decreasing = TRUE)
  ## 
  ##   24   26   22   23   20   17   25   19   27   18   28   21   29   16   15 
  ## 2788 2712 2672 2383 2314 2094 1944 1605 1558 1547 1448 1400 1371 1257  847 
  ##   30   31   32   33   14   34   35   13   12   36   37   39   38   40   10 
  ##  846  799  528  515  453  358  313  295  275  205  125  125  106   79   66 
  ##   11   41   45   44   42   43   49    9   47   46   48   52   99   51   58 
  ##   62   56   55   52   46   20   14   13   10    9    8    7    6    4    4 
  ##   93   54   64   74   90  105   50   59   62   65   68   69   79   92   96 
  ##    4    3    3    3    3    3    2    2    2    2    2    2    2    2    2 
  ##   97  101  108   53   60   61  102  109 
  ##    2    2    2    1    1    1    1    1
    
    
 # More on factors
  
 # By default, when we make a variable a factor, R assigns an internal labeling by alphabetical order.
 #   This usually doesn't concern us. One instance where we might want to have more control over the ordering
 #   is when we plot the data: for a bar plot, the category labeled 1 goes on the left-most end, followed by 2, etc.
  
  barplot(table(vehicles$drive))
  
#  If we want to, we can set the order ourselves by specifying a levels argument. Let's flip the labeling:
    
    vehicles$drive <- factor(vehicles$drive, 
                             levels = sort(unique(vehicles$drive), decreasing = TRUE))
  levels(vehicles$drive)
  ## [1] "Rear-Wheel Drive"           "Part-time 4-Wheel Drive"   
  ## [3] "Front-Wheel Drive"          "All-Wheel Drive"           
  ## [5] "4-Wheel or All-Wheel Drive" "4-Wheel Drive"             
  ## [7] "2-Wheel Drive"
  
 # Note how the barplot is now "flipped":
    
    barplot(table(vehicles$drive))
  
  
#  For ordinal variables, we need to add an ordered = TRUE argument to factor():
    
  vehicles$drive <- as.character(vehicles$drive)
    
  vehicles$drive <- factor(vehicles$drive, ordered = TRUE)
  
  str(vehicles$drive)
  
  ##  Ord.factor w/ 7 levels "2-Wheel Drive"<..: 1 1 1 1 7 7 7 5 5 5 ...
  
  levels(vehicles$drive)
  
  ## [1] "2-Wheel Drive"              "4-Wheel Drive"             
  ## [3] "4-Wheel or All-Wheel Drive" "All-Wheel Drive"           
  ## [5] "Front-Wheel Drive"          "Part-time 4-Wheel Drive"   
  ## [7] "Rear-Wheel Drive"
  head(vehicles$drive)
  
  ## [1] 2-Wheel Drive    2-Wheel Drive    2-Wheel Drive    2-Wheel Drive   
  ## [5] Rear-Wheel Drive Rear-Wheel Drive
  ## 7 Levels: 2-Wheel Drive < ... < Rear-Wheel Drive