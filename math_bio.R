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









# Modeling an infectious disease
# -- Hong Kong flu in New York City in the late 1960's -- 
#Hardly anyone was immune at the beginning of the epidemic, so almost everyone was susceptible. We will assume that there was a trace level of infection in the population, say, 10 people.2 Thus, our initial values for the population variables are
#S(0) = 7,900,000; I(0) = 10; R(0) = 0
#In terms of the scaled variables, these initial conditions are
# s(0) = 1; i(0) = 1.27 x 10- 6; R(0)=0
#We don't know values for the parameters  beta  and  gamma   yet, but we can estimate them, and then adjust them as necessary to fit the excess death data. We have already estimated the average period of infectiousness at three days, so that would suggest  gamma = 1/3.  If we guess that each infected would make a possibly infecting contact every two days, then  beta  would be  1/2.  We emphasize that this is just a guess. The following plot shows the solution curves for these choices of  beta  and  gamma. 


SIRS <- function(t, y, parms) {
  
  with(as.list(c(y, parms)),{
    
    # Change in Susceptibles
    dS <- - beta * S * I + delta * R
    
    # Change in Infecteds
    dI <- beta * S * I - gamma * I
    
    # Change in Recovereds
    dR <- gamma * I - delta * R
    
    return(list(c(dS, dI, dR)))
  })
}

