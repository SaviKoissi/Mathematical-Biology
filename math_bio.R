############ Mathematical Biology [Savi M.K. 2021]################
## Exponential growth
#We select five different values for r: two negative, zero, and two positive. We let t
#include the integers from 1 to 100. We then use sapply to apply our function of
#continuous exponential growth to each r, across all time steps. This results in a
#matrix where each row is the population size at each time t, and each column uses
#a different r.
r <- c(-0.03, -0.02, 0, 0.02, 0.03)
N0 <- 2
t <- 1:100
cont.mat <- sapply(r, function(ri) N0 * exp(ri * t))
#Next we create side-by-side plots, using both arithmetic and logarithmic scales, and
#add a legend.
layout(matrix(1:2, nrow = 1))
matplot(t, cont.mat, type = "l", ylab = "N", col = 1)
legend("topleft", paste(rev(r)), lty = 5:1, col = 1, bty = "n",
          title = "r")
# log of the value
matplot(t, cont.mat, type = "l", ylab = "N", log = "y", col = 1)
legend("topleft", paste(rev(r)), lty = 5:1, col = 1, bty = "n",
       title = "r")
#Logistic growth of Australian Fox
###Create some fake population data, of let's say newly introduced fox population
t = (seq(1900,1920,1)) #####time vector
N = (sort(round((runif(21,200,2489)),0), decreasing = F) )###population vector, rounded and sorted in ascending order
pop<- as.data.frame(cbind(t,N)) ###bind columns
head(pop)
##############Let's determine the value of  'r'
len=length(pop$t) 
##calculate r as r = log(Nt+1/Nt) [From the derivative of an expo growth]
r1= pop$N[-1]/pop$N[-len]
r=log(r1)
r
y=r##where y=r, x= pop$N[1len-1]
x= pop$N[1:len-1]
fit.lm= lm(y~x)
plot(x,y,xlab='Population', ylab='Population growth rate')
abline(fit.lm)
#####looking at the plot it looks like this population has a logistic growth trend 
#######find rmax and K
rmax= fit.lm$coefficients[1]
rmax
slope= fit.lm$coefficients[2]
##############
#K #carrying capacity
K = -rmax/slope
K
#We will project our population using logistic growth model
N0= pop$N[1] #starting population
time= 1:20
N_t = rep(NA, length(t))##create a empty vector to store results
N_t[1]=N0
###########
c.logist<- function(N0,r,K,time){
  N_t = rep(NA, length(time))#empty vector
  N_t[1] = N0 #initial pop size
  for (i in 2: length (time)){
    N_t[i] = K / (1 + ((K - N0) / N0) * exp(-r * time[i]))
  }
  
  return(N_t)
}
N_t= c.logist(N0=N0, r=rmax,time=time,K=K)
matplot(time, N_t, type = "l", ylab = "N", xlab= "Time", col = "blue")
# Lotka-Volterra prey-predator model
# In this section and in the following one you will need to use the package deSolve. This package is usefull to solve numerically a system of ODEs
if(!require(deSolve)){
  install.packages("deSolve")
  library(deSolve)
}


LotVmod <- function (Time, State, Pars) {
  with(as.list(c(State, Pars)), {
    dx = x*(alpha - beta*y) # Representing the change in prey
    dy = -y*(gamma - delta*x) # stands for the change in predators
    return(list(c(dx, dy)))
  })
}

Pars <- c(alpha = 2, beta = .5, gamma = .2, delta = .6)
State <- c(x = 10, y = 10)
Time <- seq(0, 100, by = 1)

out <- as.data.frame(ode(func = LotVmod, y = State, parms = Pars, times = Time))

matplot(out[,-1], type = "l", xlab = "time", ylab = "population")
legend("topright", c("Predator","Prey" ), lty = c(1,2), col = c(1,2), box.lwd = 0)

# Modeling an infectious disease
# -- Covid-19 in NRW in the earlier 2020's -- 
#Hardly anyone was immune at the beginning of the epidemic, so almost everyone was susceptible. We will assume that there was a trace level of infection in the population, say, 10 people.2 Thus, our initial values for the population variables are
#S(0) = 7,900,000; I(0) = 10; R(0) = 0
#In terms of the scaled variables, these initial conditions are
# s(0) = 1; i(0) = 1.27 x 10- 6; R(0)=0
#We don't know values for the parameters  beta  and  gamma   yet, but we can estimate them, and then adjust them as necessary to fit the excess death data. We have already estimated the average period of infectiousness at three days, so that would suggest  gamma = 1/3.  If we guess that each infected would make a possibly infecting contact every two days, then  beta  would be  1/2.  We emphasize that this is just a guess. The following plot shows the solution curves for these choices of  beta  and  gamma. 

# Variables
S = 1; I = 1.27 * 1e-6; R=0
#S = 7900000; I = 10; R = 0
# Parameters
beta=1/2; gamma = 1/3
parms<-list(beta, gamma)

SIR <- function(t, y, parms) {
    with(as.list(c(y, parms)),{
    # Change in Susceptible
    dS <- - beta * S * I 
    # Change in Infected
    dI <- beta * S * I - gamma * I
    # Change in Recovered
    dR <- gamma * I
    return(list(c(dS, dI, dR)))
  })
}
init<- c(S=S, I=I, R=R)

# Constructing time vector
t_start<-0 #Start
t_end<-150-1 # End 
t_inc<-1
t_range<-seq(t_start,t_end+t_inc, t_inc)
out <- ode(y = init, times = t_range, func = SIR, parms = parms)
out <- as.data.frame(out)
## Delete time variable
#out$time <- NULL
## Show data
head(out, 5)

## Plot
matplot(x = t_range, y = out[,2:4], type = "l",
        xlab = "Days", ylab = "Susceptible and Recovered", main = "SIR Model",
        lwd = 1, lty = 1, bty = "l", col = 2:4)

## Add legend
legend(20, 0.7, c("Susceptible", "Infected", "Recovered"), pch = 1, col = 2:4, bty = "n")
