##################################
#Lecture 9: Regression Analysis
###################################

#Simple linear regression model

#Example: Linear Regression with R

library("UsingR")

 x = c(18,23,25,35,65,54,34,56,72,19,23,42,18,39,37)
 y = c(202,186,187,180,156,169,174,172,153,199,193,174,198,183,178)
 plot(x,y) # make a plot
 abline(lm(y ~ x)) # plot the regression line
 
 lm(y ~ x) # the basic values of the regression analysis
  # Call:
  #  lm(formula = y ~ x)
  #Coefficients:
  #  (Intercept) x
  #210.0485 -0.7977
 
 
 lm.result=simple.lm(x,y)
  summary(lm.result)
# # Call:
# #   lm(formula = y ~ x)
#  ...
# # Coefficients:
# #   Estimate Std. Error t value Pr(>|t|)
#  #(Intercept) 210.04846 2.86694 73.27 < 2e-16 ***
#  #  x -0.79773 0.06996 -11.40 3.85e-08 ***
 
 coef(lm.result) # or use lm.result[['coef']]
 #(Intercept) x
 #210.0484584 -0.7977266
  lm.res = resid(lm.result) # or lm.result[['resid']]
  summary(lm.res)
# Min. 1st Qu. Median Mean 3rd Qu. Max.
# -8.926e+00 -2.538e+00 3.879e-01 -1.628e-16 3.187e+00 6.624e+00 
##############################################  
  #Testing the assumptions of the model 
###########################################
  
  plot(lm.result)
 
  
  # 
  # Note, this is different from plot(x,y) which produces a scatter plot. These plots have:
  #   Residuals vs. fitted This plots the fitted (by) values against the residuals. Look for spread around the line y = 0
  # and no obvious trend.
  # Normal qqplot The residuals are normal if this graph falls close to a straight line.
  # Scale-Location This plot shows the square root of the standardized residuals. The tallest points, are the largest
  # residuals.
  # Cook's distance This plot identifies points which have a lot of in
  # uence in the regression line.
  
  
#################################  
#General Example  
##################################  
  lm.result = lm(y ~ x)
  
  summary(lm.result)
  
  plot(x,y)
  
  abline(lm.result)
  
  resid(lm.result)
  
  coef(lm.result)
  
  coef(lm.result)[1]
  
  coef(lm.result)['x']
  
  fitted(lm.result)
  
  coefficients(lm.result)
 
  coefficients(summary(lm.result))
  
  coefficients(summary(lm.result))[2,2]
  
  coefficients(summary(lm.result))['x','Std. Error']
  
  predict(lm.result,data.frame(x= c(50,60)))
  
  predict(lm.result,data.frame(x=sort(x)), # as before
          level=.9, interval="confidence") # what is new
  
  plot(x,y)
  abline(lm.result)
   ci.lwr = predict(lm.result,data.frame(x=sort(x)),
                      level=.9,interval="confidence")[,2]
   points(sort(x), ci.lwr,type="l") # or use lines()
  
   curve(predict(lm.result,data.frame(x=x),
                   interval="confidence")[,3],add=T)
  