# Mathematical-Biology
Seminar Lecture/ Zef by [Savi M.Koissi](https://www.zef.de/project-homepages/one-health/template-following/phd-researchers-projects/ghana/merveille-koissi-savi.html) - Jan 2021

This initiation is developed specifically in the framework of the lecture-seminar organized by ZEF and do not enclose everything regarding programming in this environment.  


## Brief initiation to R software
## Installation of R 

  
R is a free software environment for statistical computing and graphics. It compiles and runs on a wide variety of UNIX platforms, Windows and MacOS. 
* You can download R [here](https://cran.r-project.org/mirrors.html). 
* And then R studio [here](https://rstudio.com/products/rstudio/download/)

Once R and Rstudion is installed on your computer, the software is executed by launching the corresponding executable. 
The prompt, by default **‘>’**, indicates that R is waiting for your commands. Under Windows using the program Rgui.exe, some commands (accessing the on-line help, opening files, . . .) can be executed via the pull-down menus. At this stage, a new user is likely to wonder “Whatdo I do now?” It is indeed very useful to have a few ideas on how R works when it is used for the first time, and this is what we will see now. We shall see first briefly how R works. Then, I will describe the “assign” operator which allows creating objects, how to manage objects in memory, and finally how to use the on-line help which is very useful when running R.


### Objects and classes in R


R is an objects-oriented programming (OOP) language in another words the paradigm in where different methods are used to design software around data or objects rather than using functions. 

R supports five type of objects including scalars, vectors, matrices, data frames, and lists
##### Numeric or Scalar 
They are single number assigned to object. Let us create an object a with the value 3.5. The assignment to the object to a name is particularly important when iterative computation are performed on the object. 
* When two objects are assigned the same name the last one erase the first. Therefore, while assigning an object, make sure that the denotation is not the same. 
* R is a key sensitive software therefore an object denoted **H** is different from an object denoted **h**
* You should avoid assigning objects to basic R functions like **TRUE / T**, **mean**, **max**, **min**, **t**. 



```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


```{r cars, echo=T}
>a<-3.5
> class(a)
[1] "numeric"
```


###### Exercise
1- Create 10 scalars in R\
2- Multiply the first object by the second; denote this object mt4\
3- Divide the result mt4 by the fourth object; denote this object mt3\
4- Compute the sum of the object from the fifth to the 10th position; denote this object mt2\
5- Compute the sinus of the sum of the response 2, 3 and 4; denote this object mt1

##### Logical / Boolean
Two booleans are in R namely **TRUE** or **T**; **FALSE** or **F**. However, some characters could also be considered in this realm there are **NA**; **NaN**

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r cars, echo=T}
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

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r cars, echo=T}
> a & b           # AND
[1] FALSE
> a | b           # OR
[1] TRUE
> !b              # Is no b
[1] TRUE
```


##### Character / String
Contrary to the scalr that are numerical object, the characters are the set of non numerical objects or numerical objects purposely transformed into non numerical objects. The nature of a numerical object can also be transformed if in the object there is a chain of characters. 

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r cars, echo=T}
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

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r cars, echo=T}
> o <- c(1,2,5.3,6,-2,4)                             # Numeric vector
> p <- c("one","two","three","four","five","six")    # Character vector
> q <- c(TRUE,TRUE,FALSE,TRUE,FALSE,TRUE)            # Logical vector
```
###### Exercise
1- Create a vector of logic\
2- Coerce the elemet mt5 into a character\
3- Create a vector of 10 characters with the first element be mt5 denote this new object created mt\
4- Extract the second element of the object mt

##### Matrix

A matrix contains a set of numerical elements arranged in a two-dimensional rectangular layout encapsulate by the function **matrix()**.
The basic syntax of **matrix()** for creating a matrix in R is the following 

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r cars, echo=T} 
matrix(data, nrow, ncol, byrow, dimnames)
```
Here is the description of the **arguments** or parameters used:

* **data** is the input vector which becomes the data elements of the matrix.

* **nrow** is the number of rows to be created.

* **ncol** is the number of columns to be created.

* **byrow** is a logical clue. If TRUE then the input vector elements are arranged by row.

* **dimname** is the names assigned to the rows and columns.


```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r cars, echo=T} 

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

Similar to the vector the **operator []** could be used for a extraction of elements

###### Exercise
Set a seed in R. 
1- Create a matrix m1 composed by 7 rows and 3 columns arranged by colunm/
2- Create a matrix m2 composed by  7 rows and 3 columns arranged by row/
3- Check if m1 is equal to m2/
4- Extract from m1 the element on the row 3 and column 3

##### Data frame
A data frame is a more matrix containing different nature of objects

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r cars, echo=T} 

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

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r cars, echo=T} 

> l <-list(vec=p, mat=t, fra=mydata, count=3)         # a list with a vector, a matrix, a data frame defined earlier and a scalar
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
> l$vec                                                         # extract components from list
[1] "one"   "two"   "three" "four"  "five"  "six" 
> l$mat[2,3]
[1] 10
> l$fra$Color
[1] red   white red   <NA>
Levels: red white
```


  
### Built In 

You have already see two built in namely **c()** and **matrix()**. However, you can encounter more than the aboved-mentionned 
