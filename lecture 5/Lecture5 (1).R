##########################
#Lecture 5: Multivariate Data
###########################

#Storing multivariate data in data frames

weight = c(150, 135, 210, 140)
 height = c(65, 61, 70, 65)
 gender = c("Fe","Fe","M","Fe")
 study = data.frame(weight,height,gender) # make the data frame
 study
study = data.frame(w=weight,h=height,g=gender)
row.names(study)<-c("Mary","Alice","Bob","Judy")

###########################################
#Accessing data in data frames
##########################################
study

 rm(weight) # clean out an old copy
 weight
#Error: Object "weight" not found
 attach(study)
 weight
#[1] 150 135 210 140
 
  study[,'weight'] # all rows, just the weight column
 #150 135 210 140
  
study[,1] # all rows, just the first column

study[,1:2]
 study['Mary',]

study['Mary','weight']

study$weight # using $
#[1] 150 135 210 140

 study[['weight']] # using the name.
 study[['w']] # unambiguous shortcuts are okay
 study[[1]] # by position

 study[study$gender == 'Fe', ] # use $ to access gender via a list
########################################################################
 
 #Manipulating data frames: stack and unstack
 
 ##################################################################
 
 data(PlantGrowth)
 PlantGrowth
 
 attach(PlantGrowth)
 weight.ctrl = weight[group == "ctrl"]
 unstack(PlantGrowth)
 boxplot(unstack(PlantGrowth))
 
 
 ##############################################################
 #Using R's model formula notation
 ##########################################################
 #weight ~ group as "model weight by the variable group".
 
 boxplot(weight ~ group)
 
# response ~ predictor (when two variables).
 
 
#  formula meaning
# Y ~ X1 Y is modeled by X1
# Y ~ X1 + X2 Y is modeled by X1 and X2 as in multiple regression
# Y ~ X1 * X2 Y is modeled by X1, X2 and X1*X2
# (Y ~ (X1 + X2)^2) Two-way interactions. Note usual powers
# Y ~ X1+ I((X2^2) Y is modeled by X1 and X22
# Y ~ X1 | X2 Y is modeled by X1 conditioned on X2
 
 
########################################################## 
# Ways to view multivariate data
########################################################## 
 
#n-way contingency tables
 
 library(MASS);data(Cars93);attach(Cars93)
 ## make some categorical variables using cut
 
 price = cut(Price,c(0,12,20,max(Price)))
levels(price)=c("cheap","okay","expensive")
 mpg = cut(MPG.highway,c(0,20,30,max(MPG.highway)))
levels(mpg) = c("gas guzzler","okay","miser")

## now look at the relationships
 table(Type)

 table(price,Type)
 
 
 table(price,Type,mpg)
 
 #barplots
 
 barplot(table(price,Type),beside=T) # the price by different types
  barplot(table(Type,price),beside=T) # type by different prices
 ########################################################################
 #Example: Boxplot of samples of random data
##########################################################################  
  
  y=rnorm(1000) # 1000 random numbers
   f=factor(rep(1:10,100)) # the number 1,2...10 100 times
   boxplot(y ~ f,main="Boxplot of normal random data with model notation")
  
  #stripcharts
  
   x = rnorm(100)
    y = factor(rep(1:10,10))
    stripchart(x ~ y)
  
    
  #violinplots and densityplots
    
    par(mfrow=c(1,3)) # 3 graphs per page
     data(InsectSprays) # load in the data
     boxplot(count ~ spray, data = InsectSprays, col = "lightgray")
     simple.violinplot(count ~ spray, data = InsectSprays, col = "lightgray")
     simple.densityplot(count ~ spray, data = InsectSprays)
  
  
 #scatterplots 
      plot(x,y) # simple scatterplot
      
      z= factor(rep(1:10,10))
      points(x,z,pch="19") # plot these with a triangle
      
##############################################################################      
      
 #Example: Tooth growth     
      
 #############################################################################
      
      data("ToothGrowth")
       attach(ToothGrowth)
       plot(len ~ dose,pch=as.numeric(supp))
      ## click mouse to add legend.
       tmp = levels(supp) # store for a second
       #legend(locator(1),legend=tmp,pch=1:length(tmp))
       detach(ToothGrowth) 
      
 ######################################################################
       
       #Example: GDP vs. CO2 emissions
      
 #############################################################     
      
       data(emissions) # or read in from dataset
        attach(emissions)
        simple.scatterplot(perCapita,CO2)
        title("GDP/capita vs. CO2 emissions 1999")
        detach(emissions)
      
        
    #paired scatterplots    
        
        pairs(emissions)

        