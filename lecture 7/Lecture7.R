###########################
#Leacture 7: Simulations
##########################

#The central limit theorem

n=10;p=.25;S= rbinom(1,n,p)
 (S - n*p)/sqrt(n*p*(1-p))
n = 10;p = .25;S = rbinom(100,n,p)
X = (S - n*p)/sqrt(n*p*(1-p)) # has 100 random numbers
hist(X,prob=T)

#For loops

results =numeric(0) # a place to store the results
 for (i in 1:100) { # the for loop
   S = rbinom(1,n,p) # just 1 this time
   results[i]=(S- n*p)/sqrt(n*p*(1-p)) # store the answer
 }

################################################
#R Basics: Syntax for for
###############################################
#A "for" loop has a simple syntax:
for(variable in vector) { command(s) }


 primes=c(2,3,5,7,11);
## loop over indices of primes with this
for(i in 1:5) print(primes[i])
## or better, loop directly
 for(i in primes) print(i)
 ####################################################
 
 #Example: CLT with normal data
 
 
#(mean(X) - mu)/(sigma/sqrt(n))
 
 
 results = c();
  mu = 0; sigma = 1
  for(i in 1:200) {
    X = rnorm(100,mu,sigma) # generate random data
    results[i] = (mean(X) - mu)/(sigma/sqrt(100))
    }
  hist(results,prob=T)
  
#Normal plots
  
   x = rnorm(100,0,1);qqnorm(x,main='normal(0,1)');qqline(x)
   x = rnorm(100,10,15);qqnorm(x,main='normal(10,15)');qqline(x)
   x = rexp(100,1/10);qqnorm(x,main='exponential mu=10');qqline(x)
   x = runif(100,0,1);qqnorm(x,main='unif(0,1)');qqline(x) 
  
  
   
   ###################################################
   #Using simple.sim and functions
   ###################################################
   
   f = function () {
      S = rbinom(1,n,p)
      (S- n*p)/sqrt(n*p*(1-p))
      }
   
   x=simple.sim(100,f)
    hist(x)
    f = function(n=100,p=.5) {
       S = rbinom(1,n,p)
       (S- n*p)/sqrt(n*p*(1-p))
       }
   
    simple.sim(1000,f,100,.5)
   
    
    the.range = function (x) max(x) - min(x)
    
    find.IQR = function(x) {
       five.num = fivenum(x) # for Tukey's summary
       five.num[4] - five.num[2]
       }
    
    x = rnorm(100) # some sample data
     find.IQR # oops! no argument. Prints definition.
    function(x) {
      five.num = fivenum(x)
      five.num[4] - five.num[2]
    }
     find.IQR(x) # this is better
##########################################################    
   #  Example: A function to sum normal numbers   
########################################################
     
     f = function(n=100,mu=0,sigma=1) {
        nos = rnorm(n,mu,sigma)
        (mean(nos)-mu)/(sigma/sqrt(n))
     }
     
     simulations = simple.sim(100,f,100,5,5)
      hist(simulations,breaks=10,prob=TRUE)
     
###########################################################
      #Example: CLT with exponential data
#########################################################
      
      f = function(n=100,mu=10) (mean(rexp(n,1/mu))-mu)/(mu/sqrt(n))
      
      xvals = seq(-3,3,.01) # for the density plot
       hist(simple.sim(100,f,1,10),probability=TRUE,main="n=1",col=gray(.95))
       points(xvals,dnorm(xvals,0,1),type="l") # plot normal curve
#      ... repeat for n=5,15,50
      
      
     
     
     
   
   
   
   
   
  
  
 
 
 