##################################
#Lecture6: Random Data
##################################

 sample(1:6,10,replace=T)
#[1] 6 4 4 3 5 2 3 3 5 4
set.seed(1400)
 RollDie = function(n) sample(1:6,n,replace=T)
 RollDie(5)
#[1] 3 6 1 2 2
 
 #Uniform
  runif(1,0,2) # time at light
# [1] 1.490857 # also runif(1,min=0,max=2)
  runif(5,0,2) # time at 5 lights
 #[1] 0.07076444 0.01870595 0.50100158 0.61309213 0.77972391
  runif(5) # 5 random numbers in [0,1]
# [1] 0.1705696 0.8001335 0.9218580 0.1200221 0.1836119
 
  x=runif(100) # get the random numbers
  hist(x,probability=TRUE,col=gray(.9),main="uniform on [0,1]")
  curve(dunif(x,0,1),add=T)
 #Normal 
   rnorm(1,100,16) # an IQ score
  #[1] 94.1719
   rnorm(1,mean=280,sd=10)
  #[1] 270.4325 # how long for a baby (10 days early)
  
   x=rnorm(100)
   hist(x,probability=TRUE,col=gray(.9),main="normal mu=0,sigma=1")
   curve(dnorm(x),add=T)
  ## also for IQs using rnorm(100,mean=100,sd=16)
   
#Binomial
   
   n=1;   p=.5 # set the probability
    rbinom(1,n,p) # different each time
   #[1] 1
    rbinom(10,n,p) # 10 different such numbers
   #[1] 0 1 1 0 1 0 1 0 1 0
   set.seed(123)
    n = 10; p=.5
    rbinom(1,n,p) # 6 successes in 10 trials
   #[1] 6
    rbinom(5,n,p) # 5 binomial number
   #[1] 6 6 4 5 4
    
   
     n=5;p=.25 # change as appropriate
     x=rbinom(100,n,p) # 100 random numbers
     hist(x,probability=TRUE)
    ## use points, not curve as dbinom wants integers only for x
     xvals=0:n;
     points(xvals,dbinom(xvals,n,p),type="h",lwd=3)
     points(xvals,dbinom(xvals,n,p),type="p",lwd=3)
    #... repeat with n=15, n=50
    
    #Exponential
     
     x=rexp(100,1/2500)
      hist(x,probability=TRUE,col=gray(.9),main="exponential mean=2500")
      curve(dexp(x,1/2500),add=T)
    
    
  #Sampling with and without replacement using sample
      
      ## Roll a die
       sample(1:6,10,replace=TRUE)
      #[1] 5 1 5 3 3 4 5 4 2 1 # no sixes!
      ## toss a coin
      sample(c("H","T"),10,replace=TRUE)
     # [1] "H" "H" "T" "T" "T" "T" "H" "H" "T" "T"
      ## pick 6 of 54 (a lottery)
       sample(1:54,6) # no replacement
      #[1] 6 39 23 35 25 26
       
       
       #A bootstrap sample
       data(faithful) # part of R's base
        names(faithful) # find the names for faithful
      # [1] "eruptions" "waiting"
        eruptions = faithful[['eruptions']] # or attach and detach faithful
        sample(eruptions,10,replace=TRUE)
      # [1] 2.03 4.37 4.80 1.98 4.32 2.18 4.80 4.90 4.03 4.70
        
        par(mfrow=c(1,2))
        hist(eruptions,breaks=25) # the dataset
       ## the bootstrap sample
        hist(sample(eruptions,100,replace=TRUE),breaks=25)
        
        
     #   d, p and q functions
        
        pnorm(1.645) # standard normal
       # [1] 0.7580363
         pnorm(.7,1,1) # normal mean 1, std 1
       # [1] 0.3820886
        
        pnorm(.7,lower.tail=F)
       # [1] 0.2419637
       
         qnorm(.75)
       # [1] 0.6744898
         
         
      #Standardizing, scale and z scores
         
         x = rnorm(5,100,16)
         
        x
        # [1] 93.45616 83.20455 64.07261 90.85523 63.55869
          z = (x-100)/16
          z
        # [1] -0.4089897 -1.0497155 -2.2454620 -0.5715479 -2.2775819
         
          pnorm(z)
         #[1] 0.34127360 0.14692447 0.01236925 0.28381416 0.01137575
          pnorm(x,100,16) # enter in parameters
        # [1] 0.34127360 0.14692447 0.01236925 0.28381416 0.01137575
         
         
        
        
      
    
    
    
    
   