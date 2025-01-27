#Lecture 3
#Mabahes Amari
#17-12-99
##############################
#Univariate Data
#############################
#Categorical data

#Using tables
#Example: Smoking survey
#A survey asks people if they smoke or not. The data is
#Yes, No, No, Yes, Yes
#We can enter this into R with the c() command, and summarize with the table command as follows

 x=c("Yes","No","No","Yes","Yes")
 table(x)
 
#############################################
 #Factors
  x=c("Yes","No","No","Yes","Yes")
  x # print out values in x

  factor(x) # print out value in factor(x)
 
 #Levels: No Yes # notice levels are printed.
 ##############################################
#  Bar charts
 # Exapmle:Blood Type
  #Suppose, a group of 25 people are surveyed as to their boold type
 Blood <- c(3, 4, 1, 1, 3, 4, 3, 3, 1, 3, 2, 1, 2, 1, 2, 3, 2, 3, 1, 1, 1, 1, 4, 3, 1)

 barplot(Blood ) # this isn't correct
barplot(table(Blood )) # Yes, call with summarized data
 barplot(table(Blood )/length(Blood )) # divide by n for proportion
 
 ###########################################################
 #Pie chart
 Blood.counts = table(Blood) # store the table result
  pie(Blood.counts) # first pie -- kind of dull
  names(Blood.counts) = c("A","B","AB","O") # give names
 pie(Blood.counts) # prints out names
  pie(Blood.counts,col=c("purple","green2","cyan","white"))
 # now with colors
#############################################
#Numerical data
#############################################  
 # Example: CEO salaries
 # Suppose, CEO yearly compensations are sampled and the following are found (in millions).
  
  
  sals = c(12, .4, 5, 2, 50, 8, 3, 1, 4, 0.25) # read in with scan
  
    
   mean(sals) # the average
 # [1] 8.565
   var(sals) # the variance
 # [1] 225.5145
   sd(sals) # the standard deviation
 # [1] 15.01714
   median(sals) # the median
 # [1] 3.5
   fivenum(sals) # min, lower hinge, Median, upper hinge, max
#  [1] 0.25 1.00 3.50 8.00 50.00
   summary(sals)
   
   #################################################
   #The difference between fivenum and the quantiles.
   ################################################
  
   data=c(10, 17, 18, 25, 28, 28)
   summary(data)
   
  
    quantile(data,.25)
   
  
    quantile(data,c(.25,.75)) # two values of p at once   25% 75%
     
    
      sort(sals)
     #[1] 0.25 0.40 1.00 2.00 3.00 4.00 5.00 8.00 12.00 50.00
      fivenum(sals) # note 1 is the 3rd value, 8 the 8th.
    # [1] 0.25 1.00 3.50 8.00 50.00
      summary(sals) # note 3.25 value is 1/4 way between 1 and 2
   # Min. 1st Qu. Median Mean 3rd Qu. Max.
    # 0.250 1.250 3.500 8.565 7.250 50.000
     
#########################################
     
      mean(sals,trim=1/10) # trim 1/10 off top and bottom
   #  [1] 4.425
      mean(sals,trim=2/10)
    # [1] 3.833333
      IQR(sals)
     #The median average deviation (MAD) median|Xi ??? median(X)|(1.4826)
      
       mad(sals)
      #[1] 4.15128
     # And to see that we could do this ourself, we would do
      
       median(abs(sals - median(sals))) # without normalizing constant
     # [1] 2.8
       median(abs(sals - median(sals))) * 1.4826
     # [1] 4.15128
      
      
#########################################
      #Stem-and-leaf Charts
#######################################     
      
       scores = c(2, 3, 16, 23, 14, 12, 4, 13, 2, 0, 0, 0, 6, 28, 31, 14, 4, 8, 2, 5)
      
       apropos("stem") # What exactly is the name?
      
       #[1] "stem" "system" "system.file" "system.time"
       stem(scores)
      
  #Example: Making numeric data categorical
  #Suppose the salaries are again
  #     12 .4 5 2 50 8 3 1 4 .25
  #     And we want to break that data into the intervals
  #     [0, 1],(1, 5],(5, 50]     
        sals = c(12, .4, 5, 2, 50, 8, 3, 1, 4, .25) # enter data
        cats = cut(sals,breaks=c(0,1,5,max(sals))) # specify the breaks
        cats # view the values
       #[1] (5,50] (0,1] (1,5] (1,5] (5,50] (5,50] (1,5] (0,1] (1,5] (0,1]
 table(cats) # organize

 levels(cats) = c("poor","rich","rolling in it") # change labels
 table(cats)

 ################################################
 #Histograms
 ################################################
 x=c(29.6, 28.2, 19.6, 13.7, 13.0, 7.8, 3.4, 2.0, 1.9, 1.0, 0.7, 0.4, 0.4, 0.3,
     0.3, 0.3, 0.3, 0.3, 0.2, 0.2, 0.2, 0.1, 0.1, 0.1, 0.1, 0.1)
 hist(x) # frequencies
  hist(x,probability=TRUE) # proportions (or probabilities)
  rug(jitter(x)) # add tick marks
  
hist(x,breaks=10) # 10 breaks, or just hist(x,10)
hist(x,breaks=c(0,1,2,3,4,5,10,20,max(x))) # specify break points

################################################
#Boxplots
#################################################
#Example: Movie sales, reading in a dataset
install.packages("UsingR")
library(UsingR)
 data(movies) # read in data set for gross.
 names(movies)
#[1] "title" "current" "previous" "gross"
 attach(movies) # to access the names above
 boxplot(current,main="current receipts",horizontal=TRUE)
 boxplot(gross,main="gross receipts",horizontal=TRUE)
 detach(movies) # tidy up

 ###############################################
 #Frequency Polygons
 ###############################################
  x = c(.314,.289,.282,.279,.275,.267,.266,.265,.256,.250,.249,.211,.161)
  tmp = hist(x) # store the results
  lines(c(min(tmp$breaks),tmp$mids,max(tmp$breaks)),c(0,tmp$counts,0),type="l")
 
#################################################
  
  #Densities
##############################################
 
  data(faithful)
   attach(faithful) # make eruptions visible
   hist(eruptions,15,prob=T) # proportions, not frequencies
   lines(density(eruptions)) # lines makes a curve, default bandwidth
   lines(density(eruptions,bw="SJ"),col="red") # Use SJ bandwidth, in red
 
 
 
 
 
 
 
 
 
 
       
      
  