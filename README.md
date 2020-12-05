# Mathematical-Biology
Seminar Lecture/ Zef by Savi M.Koissi- Jan 2021
## Brief initiation to R software

R is a free software environment for statistical computing and graphics. It compiles and runs on a wide variety of UNIX platforms, Windows and MacOS. You can download R [here](https://cran.r-project.org/mirrors.html). 
Once R is installed on your computer, the software is executed by launching the corresponding executable. The prompt, by default **‘>’**, indicates that R is waiting for your commands. Under Windows using the program Rgui.exe, some commands (accessing the on-line help, opening files, . . .) can be executed via the pull-down menus. At this stage, a new user is likely to wonder “Whatdo I do now?” It is indeed very useful to have a few ideas on how R works when it is used for the first time, and this is what we will see now. We shall see first briefly how R works. Then, I will describe the “assign” operator which allows creating objects, how to manage objects in memory, and finally how to use the on-line help which is very useful when running R.
### Objects and classes in R
R is an objects-oriented programming (OOP) language in another words the paradigm in where different methods are used to design software around data or objects rather than using functions. 
#### Objects
R supports five type of objects including scalars, vectors, matrices, data frames, and lists
##### Numeric or Scalar 
They are single number assigned to object. Let us create an object a with the value 3.5. The assignment to the object to a name is particularly important when iterative computation are performed on the object. 
* When two objects are assigned the same name the last one erase the first. Therefore, while assigning an object, make sure that the denotation is not the same. 
* R is a key sensitive software therefore an object denoted **H** is different from an object denoted **h**
* You should avoid assigning objects to basic R functions like **TRUE/T**, **means**, **max**, **min**

```{r cars, echo=T}
>a<-3.5
> class(a)
[1] "numeric"

```



### Basic functions
