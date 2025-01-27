
#Lecture 4
#14/01/1400
#######################
#Bivariate Data
######################




#Person Smokes  amount of Studying
#1        Y     less than 5 hours
#2        N      5 - 10 hours
#3        N      5 - 10 hours
#4        Y     more than 10 hours
#5        N     more than 10 hours
#6        Y     less than 5 hours
#7        Y      5 - 10 hours
#8        Y     less than 5 hours
#9        N      more than 5 hours
#10       Y      5 - 10 hours


 smokes = c("Y","N","N","Y","N","Y","Y","Y","N","Y")
 amount = c(1,2,2,3,3,1,2,1,3,2)
 table(smokes,amount)
  tmp=table(smokes,amount) # store the table
  old.digits = options("digits") # store the number of digits
  options(digits=3) # only print 3 decimal places
  prop.table(tmp,1) # the rows sum to 1 now

  prop.table(tmp,2) # the columns sum to 1 now


  prop.table(tmp)
 
  options(digits=old.digits) # restore the number of digits
  
  
  ####################################
  #Plotting tabular data
  ####################################
  barplot(table(smokes,amount))
   barplot(table(amount,smokes))
   smokes=factor(smokes) # for names
   barplot(table(smokes,amount),
             beside=TRUE, # put beside not stacked
            legend.text=T) # add legend
  
     barplot(table(amount,smokes),main="table(amount,smokes)",
               beside=TRUE,
               legend.text=c("less than 5","5-10","more than 10")) 
     
     
     prop = function(x) x/sum(x)
     apply(tmp,2,prop)
     t(apply(tmp,1,prop))

###########################################
#Handling bivariate data: categorical vs. numerical
 ##############################################
     
  #   experimental: 5 5 5 13 7 11 11 9 8 9
  #   control: 11 8 4 5 9 5 10 5 4 10   
     
     x = c(5, 5, 5, 13, 7, 11, 11, 9, 8, 9)
     y = c(11, 8, 4, 5, 9, 5, 10, 5, 4, 10)
     boxplot(x,y)
     
 #amount: 5 5 5 13 7 11 11 9 8 9 11 8 4 5 9 5 10 5 4 10
#category: 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2    
     
     amount = c(5 ,5, 5 ,13, 7, 11, 11 ,9 ,8, 9, 11, 8, 4, 5 ,9, 5, 10, 5, 4, 10)
    
     category = c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2)
     
      boxplot(amount ~ category) 
     
###################################################
#Bivariate data: numerical vs. numerical
################################################
      library("UsingR");
       data(home) # read in dataset home
       attach(home)
       names(home)
      
       boxplot(scale(old),scale(new)) #make boxplot after scaling each
       
####################################################
#Using scatterplots to compare relationships
###############################################
     #  Example: Home data
      # The home data example of the previous section shows old assessed value (1970) versus new assessed value
     # (2000). There should be some relationship. Let's investigate with a scatterplot (gure 12).
        data(home);
        plot(old,new)
        
       data(homedata)
        attach(homedata)
       names(homedata)
       
     # plot(homedata)
      
      plot(y1970, y2000,
           xlab="1970",
           ylab="2000")
      plot(home)
       
#########################################################
#R Basics: What does attaching do?
######################################################
      
       x = 1:2;y = c(2,4);df = data.frame(x=x,y=y)
       ls() # list all the varibles known
      #[1] "df" "x" "y"
       rm(y) # delete the y variable
       attach(df) # attach the data frame
       ls()
      #[1] "df" "x" # y is visible, but doesn't show up
       ls(pos=2) # y is in position 2 from being attached
    #  [1] "x" "y"
       y # y is visible because df is attached
     # [1] 2 4
       x # which x did we find, x or df[['x']]
    #  [1] 1 2
       x=c(1,3) # assign to x
       df # not the x in df
    #  x y
    #  1 1 2
    #  2 2 4
       detach(df)
       x # assigned to real x variable
    #  [1] 1 3
       y
    #  Error: Object "y" not found     
############################################################     
     #Linear regression.
###########################################################
      data(home);attach(home)
       x = old # use generic variable names
       y = new # for illustration only.
       plot(x,y)
       abline(lm(y ~ x))
       detach(home)
       
        data(home);attach(home)
        x = old; y = new
        simple.lm(x,y)
     
        detach(home)
       #You can also access the coecients directly with the function coef. The above ones would be found with
       lm.res = simple.lm(x,y) # store the answers in lm.res
        coef(lm.res)
       
        coef(lm.res)[1] # first one, use [2] for second
       
        simple.lm(x,y,show.residuals=TRUE)
        
        lm.res = simple.lm(x,y)
         the.residuals = resid(lm.res) # how to get residuals
         plot(the.residuals)
         
         summary(lm(y ~ x))
         
          cor(x,y) # to find R
        # [1] 0.881
          cor(x,y)^2 # to find R^2
        # [1] 0.776
  
         # The Spearman rank correlation is the same thing only applied to the ranks of the data. The rank of a data set is
        #  simply another vector giving the relative rank in terms of size. An example might make it clearer
          
           rank(c(2,3,5,7,11)) # already in order
         # [1] 1 2 3 4 5
          
            rank(c(5,3,2,7,11)) # for example, 5 is 3rd largest
        #  [1] 3 2 1 4 5
         
              rank(c(5,5,2,7,5)) # ties have ranks averaged (2+3+4)/3=3
        #  [1] 3 3 1 5 3
         # To find the Spearman rank correlation, we simply apply cor() to the ranked data
          
             cor(rank(x),rank(y))
          #[1] 0.925
           
          #This number is close to 1 (or -1) if there is a strong increasing (decreasing) 
           #trend in the data. (The trend need not be linear.)
         # As a reminder, you can make a function to do this calculation for you. For example,
         
            cor.sp <- function(x,y) cor(rank(x),rank(y))
          #Then you can use this as
        
            cor.sp(x,y)
          #[1] 0.925        
                 
  ################################################
    #Locating points
  ###############################################     
            
      #Example: Presidential Elections: Florida      
            
            data("florida") # or read.table on florida.txt
            
             names(florida)
             
           # [1] "County" "V2" "GORE" "BUSH" "BUCHANAN"
           # [6] "NADER" "BROWNE" "HAGELIN" "HARRIS" "MCREYNOLDS"
           # [11] "MOOREHEAD" "PHILLIPS" "Total"
             attach(florida) # so we can get at the names BUSH, ...
             
             simple.lm(BUSH,BUCHANAN)
          
             detach(florida) # clean up    
             
             
            identify(BUSH,BUCHANAN,n=2) # n=2 gives two points
            
             BUSH[50] 
             
            #[1] 152846
             
             BUCHANAN[50]
             
            #[1] 3407
             
             florida[50,]
             
             simple.lm(BUSH[-50],BUCHANAN[-50])
             
             65.57350 + 0.00348 * BUSH[50]
             
           #  We could do this prediction with the simple.lm function which calls the R function predict appropriately.
           #  Here is how
             simple.lm(BUSH[-50],BUCHANAN[-50],pred=BUSH[50])
             #[1] 597.7677
      ###############################################
             #Resistant regression
             
     ################################################    
             simple.lm(BUSH,BUCHANAN)
              abline(65.57350,0.00348) # numbers from above
              
              
  ################################################################            
            #  Using rlm or lqs for resistant regression
              
              
              library(MASS) # read in the external library
              data("florida")
              names(florida)
              attach(florida)
             # plot(florida)
               plot(BUSH,BUCHANAN) # a scatter plot
               abline(lm(BUCHANAN ~ BUSH)) # lty sets line type
               abline(rlm(BUCHANAN ~ BUSH))
              # legend(locator(1),legend=c('lm','rlm')) # add legend
               detach(florida) # tidy up   
              
              
               plot(BUSH,BUCHANAN)
               abline(rlm(BUCHANAN ~ BUSH),lty='1')
                abline(rlm(BUCHANAN[-50] ~ BUSH[-50]),lty='2')
              
              
    ##############################################################
    #R Basics: Plotting graphs using R
    ##############################################################
                
                x=seq(0,4,by=.1) # create the x values
                 plot(x,x^2,type="l") # type="l" to make line
                 curve(x^2,0,4)
              
           #     mileage      0  4   8   12  16  20  24  28  32
           #     tread wear 394 329 291 255 229 204 179 163 150 
              
                 miles = (0:8)*4 # 0 4 8 ... 32
                  tread = c(394, 329, 291, 255, 229 ,204, 179, 163, 150)
                
                  plot(miles,tread) # make the scatterplot
                 abline(lm(tread ~ miles))
                 ## or as we know the intercept and slope
                  abline(360,-7.3)
                 ## or using points
                  points(miles,360 - 7.3*miles,type="l")
                 ## or using lines  
                  lines(miles,360 - 7.3*miles)
                  ## or using curve
                   curve(360 - 7.3*x,add=T) # add a function of x
              
              
              

                
                           
              
              
              
          