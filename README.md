# Mathematical-Biology
Seminar Lecture/ Zef by [Savi M.Koissi](https://scholar.google.com/citations?user=-BCB6_0AAAAJ&hl=en) - Jan 2021

This initiation is developed specifically in the framework of the lecture-seminar organized by ZEF and does not enclose everything regarding programming in this environment.  

## Brief initiation to R software

## Installation of R 

  
R is a free software environment for statistical computing and graphics. It compiles and runs on a wide variety of UNIX platforms, Windows and MacOS. 
* You can download R [here](https://cran.r-project.org/bin/windows/base/). 
* And then R studio [here](https://rstudio.com/products/rstudio/download/)

Once R and Rstudion are installed on your computer, the software is executed by launching the corresponding executable. 
The prompt, by default **‘>’**, indicates that R is waiting for your commands. Under Windows using the program Rgui.exe, some commands (accessing the on-line help, opening files, . . .) can be executed via the pull-down menus. At this stage, a new user is likely to wonder “What do I do now?” It is indeed very useful to have a few ideas on how R works when it is used for the first time, and this is what we will see now. We shall see first the objects in R; the built-in function and how to write a function in R.


### Objects and classes in R


R is an object-oriented programming (OOP) language in other words the paradigm in where different methods are used to design software around data or objects rather than using functions. 

R supports five types of objects including scalars, vectors, matrices, data frames, and lists

##### Numeric or Scalar 

They are a single number assigned to an object. Let us create an object with the value 3.5. The assignment of the object to a name is particularly important when iterative computations are performed on the object. 
* When two objects are assigned the same name the last one erases the first. Therefore, while assigning an object, make sure that the denotation is not the same. 
* R is a key sensitive software therefore an object denoted **H** is different from an object denoted **h**
* You should avoid assigning objects to basic R functions like **TRUE / T**, **mean**, **max**, **min**, **t**. 

```{r}
>a<-3.5
> class(a)
[1] "numeric"
```


###### Exercise

1- Create 10 scalars in R\
2- Multiply the first object by the second; denote this object mt4\
3- Divide the result mt4 by the fourth object; denote this object mt3\
4- Compute the sum of the object from the fifth to the 10th position; denote this object mt2\
5- Compute the sinus of the sum of the response 2, 3, and 4; denote this object mt1

##### Logical / Boolean

Two booleans are in R namely **TRUE** or **T**; **FALSE** or **F**. However, some characters could also be considered in this realm there are **NA**; **NaN**

```{r}
>a<-3.5
>b<-7
>d<-a > b # a greater than b?
> d
[1] FALSE
> class(d)
[1] "logical"
```

###### Exercise

Compare mt4 and mt3
* check if mt4 and mt3 are equal
* If mt4<mt3
* If mt4>mt3

In addition to the logical operation above presented; there is a possibility in R to do additional logical operations

```{r}
> a & b           # AND
[1] FALSE
> a | b           # OR
[1] TRUE
> !b              # Is no b
[1] TRUE
```


##### Character / String

Contrary to scalars that are numerical objects, the characters are the set of non-numerical objects or numerical objects purposely transformed into non-numerical objects. The nature of a numerical object can also be transformed if in the object there is a chain of characters. 


```{r}
> m <- "6"; n <- "7.5"       # Because of the "" the numerical object is transformed into a character 
> m;n
[1] "6"
[1] "7.5"
> m+n                        # Is it possible to make an operation with this objects?
Error in m + n : non-numeric argument to binary operator
> class(m)
[1] "character"
> class(as.numeric(m))       # but you can coerce this character into a number
[1] "numeric"
> class(as.character(x))     # vice resa
[1] "character"
```

##### Vector

It represents a sequence of objects of the same nature encapsulated by the basic function of R **c()**. 

```{r}
> o <- c(1,2,5.3,6,-2,4)                             # Numeric vector
> p <- c("one","two","three","four","five","six")    # Character vector
> q <- c(TRUE,TRUE,FALSE,TRUE,FALSE,TRUE)            # Logical vector
```

###### Exercise

1- Create a vector of logic\
2- Coerce the element mt5 into a character\
3- Create a vector of 10 characters with the first element be mt5 denote this new object created mt\
4- Extract the second element of the object mt

##### Matrix

A matrix contains a set of numerical elements arranged in a two-dimensional rectangular layout encapsulate by the function **matrix()**.
The basic syntax of **matrix()** for creating a matrix in R is the following 

```{r} 
matrix(data, nrow, ncol, byrow, dimnames)
```

Here is the description of the **arguments** or parameters used:

* **data** is the input vector that becomes the data elements of the matrix.

* **nrow** is the number of rows to be created.

* **ncol** is the number of columns to be created.

* **byrow** is a logical clue. If TRUE then the input vector elements are arranged by row.

* **dimname** is the names assigned to the rows and columns.


```{r} 
> t <- matrix(
+     1:12,                 # the data components (Don't type "+"!)
+     nrow=4,               # number of rows
+     ncol=3,               # number of columns
+     byrow = FALSE)        # fill matrix by columns
> t                         # print the matrix
     [,1] [,2] [,3]
[1,]    1    5    9
[2,]    2    6   10
[3,]    3    7   11
[4,]    4    8   12

```

Similar to the vector the **operator []** could be used for the extraction of elements

###### Exercise

Set a seed in R. \
1- Create a matrix m1 composed of 7 rows and 3 columns arranged by column\
2- Create a matrix m2 composed of 7 rows and 3 columns arranged by row\
3- Check if m1 is equal to m2\
4- Extract from m1 the element on row 3 and column 3

##### Data frame

A data frame is a more matrix containing different nature of objects

```{r} 

> d <- c(1,2,3,4)
> e <- c("red", "white", "red", NA)
> f <- c(TRUE,TRUE,TRUE,FALSE)
> mydata <- data.frame(d,e,f)
> names(mydata) <- c("ID","Color","Passed")      # variable names
> mydata
  ID Color Passed
1  1   red   TRUE
2  2 white   TRUE
3  3   red   TRUE
4  4  <NA>  FALSE
```

##### List

A list is a vector containing different objects. 

```{r} 
>p<-c("one",  "two", "three", "four", "five", "six") 
>tr<-matrix(c(1:12),4,3, byrow=F)
>mydata<-data.frame("ID"=c(1:4), "Color"=c("red", "white", "red", NA), "Passed"=c(TRUE, TRUE, TRUE, FALSE))
> l <-list(vec=p, mat=tr, fra=mydata, count=3)  # a list with a vector, a matrix, a data frame defined earlier and a scalar
> l
$vec
[1] "one"   "two"   "three" "four"  "five"  "six" 

$mat
     [,1] [,2] [,3]
[1,]    1    5    9
[2,]    2    6   10
[3,]    3    7   11
[4,]    4    8   12

$fra
  ID Color Passed
1  1   red   TRUE
2  2 white   TRUE
3  3   red   TRUE
4  4  <NA>  FALSE

$count
[1] 3
> l$vec        # extract components from list
[1] "one"   "two"   "three" "four"  "five"  "six" 
> l$mat[2,3]
[1] 10
> l$fra$Color
[1] red   white red   <NA>
Levels: red white
```


  
### Built In 

You have already see two built-in namely **c()** and **matrix()**. However, you can encounter more than the above-mentioned 

#### plot()

This command helps to visualize data. To know the structuration of a built-in function, you can use **?** and the built-in\
e.g: ?plot

#### abs()

Return the absolute value of a numerical object

```{r}
>abs(-1)
[1] 1
```

#### sqrt()

Return the square root of a numeric objects

```{r}
>sqrt(c(2,4))
[1] 1.414214  2
```

#### seq()

It is used to create a sequence of number

```{r}
>seq(0,8,2)
[1] 0 2 4 6 8
```

#### rep()

It is used to repeat numbers

```{r}
rep(c(0,3),3)
[1] 0 3 0 3 0 3
```

#### length()

To get the length of a vector

```{r}
>length(c(1, 5, 6,  -2))
[1] 4
```

#### system.time()

Measures the time to process a computation 

```{r}
> system.time((seq1 = seq(0, 1e6, 1)))
    user  system  elapsed
    0.01  0.01    0.01
 ```
 
#### mean()
 
Compute the mean of a vector
 
```{r}
> mean(c(0, 5, 1, -10, 6))
[1] 0.4
```
 
#### var()
 
Compute the variance of a vector
 
```{r}
 >var(c(0, 5, 1, -10, 6))
  [1] 40.3
```
 
#### median()
 
Compute the median
 
```{r}
>median(c(0, 5, 1, -10, 6))
[1] 1
```

#### sample()
 
To randomly sample with a probability 

```{r}
>sample(c(0, 1), 10, replace = TRUE, prob = c(.5, .5)) # Sample 10 elements in the vector c(0,1) with equal probability to select the element of the vector
[1] 1 1 1 1 1 0 0 0 1 1
```
 
#### Distributions
 
* **runif()** uniform distribution
 
* **rnorm()** normal distribution 

When in for a simulation study there is a need to use a given distribution, it is advised to set seed to have the same output of the simulation in another computer with the same version of R software. Therefore you will use the function **set.seed()**
 
#### Statistical tests
 
* **t.test()** t test
 
* **wilcox.test()** Wilcoxson test
 
* **ln()** linear models
 
##### Exercise
 
Cite 5 examples of built-in not mentioned in this presentation and illustrate their use in R. 
 
## First programming skills
 
### Writing a function in R

A function is written to incorporate sets of instructions that you want to use repeatedly or that, because of their complexity, are better self-contained in a sub program and called when needed. A function is a piece of code written to carry out a specified task; it can or can not accept arguments or parameters and it can or can not return one or more values.\
In R, a function si contsrtucted this way: 

```{r}
function (arglist)  {body}
```

Let's write a function computing the sum of square of 2 variables

```{r}
sum.of.squares <- function(x,y) {
  x^2 + y^2
}
```
#### Exercise 

Write a function to determine the size of the population of a species using the strategy K (logistic growth). 



