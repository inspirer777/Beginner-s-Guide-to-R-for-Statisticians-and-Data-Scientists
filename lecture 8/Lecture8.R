##################################
#Lecture 8: Exploratory Data Analysis
###################################

#Our toolbox

#Example: Homedata

data(homedata) # from simple package
 attach(homedata)
 hist(y1970);hist(y2000) # make two histograms
 detach(homedata) # clean up

 attach(homedata)
 simple.eda(y1970);simple.eda(y2000)
 detach(homedata) # clean up
 
 
# Example: CEO salaries

 data(exec.pay) # or read in from file
  simple.eda(exec.pay)
  
  log.exec.pay = log(exec.pay[exec.pay >0])/log(10) # 0 is a problem
   simple.eda(log.exec.pay)

   
#Example: Taxi time at EWR
data(ewr)
 names(ewr) # only 3-10 are raw data
#[1] "Year" "Month" "AA" "CO" "DL" "HP" "NW"
#[8] "TW" "UA" "US" "inorout"
 airnames = names(ewr) # store them for later
 ewr.actual = ewr[,3:10] # get the important columns
 boxplot(ewr.actual)

    par(mfrow=c(2,4)) # 2 rows 4 columns
    attach(ewr)
    for(i in 3:10) boxplot(ewr[,i] ~ as.factor(inorout),main=airnames[i])
    detach(ewr)
    par(mfrow=c(1,1)) # return graphics as is (or close window)  
    
    
    
#Example: Symmetric or skewed, Long or short?
   
    ## symmetric: short, regular then long
    n=100
     X=runif(100);boxplot(X,horizontal=T,bty=n)
     X=rnorm(100);boxplot(X,horizontal=T,bty=n)
     X=rt(100,2);boxplot(X,horizontal=T,bty=n)
    ## skewed: short, regular then long
    # triangle distribution
     X=sample(1:6,100,p=7-(1:6),replace=T);boxplot(X,horizontal=T,bty=n)
     X=abs(rnorm(200));boxplot(X,horizontal=T,bty=n)
     X=rexp(200);boxplot(X,horizontal=T,bty=n)    
    data("iris")
    iris
    simple.eda(iris$Sepal.Length)
    