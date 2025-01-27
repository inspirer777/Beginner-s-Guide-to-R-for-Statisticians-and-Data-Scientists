
#Lecture 2 Mabahes in R
#16-12-99


#############################################################



#First, let's load the ggplot2 package. (Install the package with install.packages("ggplot2") if
#you have not done so yet.)

library(ggplot2)

#Next, run the following line of code to get the dataset as a data frame in R.
#Don't worry about the syntax; treat this as a magical incantation for now.

#be 2 rah mitavanid data ra vared konid:
#1) dar code zir file data ra ke downloud kardeied farakhan konid, adrees file ra dar system khod ra daghighan dar zir vared konid.
#2) dar panjere Enviroment gozine import Dataset ra estefade konid.
library(readr)
 df <- read_csv("worldbank_data_tidy.csv")
 View(df)
## df <- read.csv("D:/99-1400/mabahes/lecture 2",stringsAsFactors = FALSE)

#We use the str(), head() and View() functions to see the dataset:
  
str(df)
  
## 'data.frame':    2170 obs. of  11 variables:
##  $ cty_name  : chr  "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan" ...
##  $ cty_code  : chr  "AFG" "AFG" "AFG" "AFG" ...
##  $ year      : int  2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 ...
##  $ elecAccess: num  45.2 42.7 43.2 69.1 70.2 ...
##  $ gdpPerCap : num  1455 1637 1627 1807 1875 ...
##  $ compEduc  : int  9 9 9 9 9 9 9 9 9 NA ...
##  $ educPri   : num  NA NA NA NA NA NA NA NA NA NA ...
##  $ educTer   : num  NA NA NA NA NA NA NA NA NA NA ...
##  $ govEducExp: num  NA 3.46 3.44 2.52 3.43 ...
##  $ popYoung  : num  47.9 47.8 47.3 46.7 46 ...
##  $ pop       : int  28394813 29185507 30117413 31161376 32269589 33370794 34413603 35383128 36296400 37172386 ...

head(df)
##      cty_name cty_code year elecAccess gdpPerCap compEduc educPri educTer
## 1 Afghanistan      AFG 2009   45.23712  1454.663        9      NA      NA
## 2 Afghanistan      AFG 2010   42.70000  1637.378        9      NA      NA
## 3 Afghanistan      AFG 2011   43.22202  1626.765        9      NA      NA
## 4 Afghanistan      AFG 2012   69.10000  1806.764        9      NA      NA
## 5 Afghanistan      AFG 2013   70.15348  1874.766        9      NA      NA
## 6 Afghanistan      AFG 2014   89.50000  1897.526        9      NA      NA
##   govEducExp popYoung      pop
## 1         NA 47.90947 28394813
## 2    3.46196 47.79811 29185507
## 3    3.43785 47.34328 30117413
## 4    2.52441 46.73910 31161376
## 5    3.43437 46.03378 32269589
## 6    3.67390 45.28739 33370794

#Here is a short summary of the variables in the dataset (other than the obvious ones):
#   
# elecAccess: % of population with access to electricity.
# gdpPerCap: GDP per capita based on purchasing power parity. This is a proxy for how rich a country is.
# compEduc: Number of years that children are legally obliged to attend school.
# educPri: % of population aged 25 and over that attained or completed primary education.
# educTer: % of population aged 25 and over that attained or completed Bachelor's or equivalent.
# govEducExp: General government expenditure on education as a % of GDP.
# popYoung: Population between the ages of 0 to 14 as a % of total population.
# pop: Total population.

####################################################

#Histograms
#####################################################

#Histograms are a good way of understanding the distribution of a single continuous variable. 
#In this dataset, we could be interested in the distribution of GDP per capita one
#variable of interest that is probably of greatest interest is price. Let's plot
#a histogram of price to understand its distribution:
  
  ggplot() +
  geom_histogram(data = df, mapping = aes(x = gdpPerCap))
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
## Warning: Removed 250 rows containing non-finite values (stat_bin).


#Notice that we received a warning message: "Removed 250 rows containing non-finite values (stat_bin).". 
# There happened to be 250 rows that had NA as the value in the gdpPerCap column; R is warning us about it.
# As a data analyst, it would be a good idea to find out why these rows did not have any data.

# If we don't specify data or mapping inside the geom_histogram() function, it will look for these
# values in the ggplot() function. Hence, the code below will give the same result:
#   
  ggplot(data = df, mapping = aes(x = gdpPerCap)) +
  geom_histogram()
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
## Warning: Removed 250 rows containing non-finite values (stat_bin).


# R defaults to 30 bins for the histogram. We can change this by adding a bins argument to geom_histogram().
# As you can see from the histograms below, different bin widths can give very different interpretations of
# the data!
  
  ggplot(data = df) +
  geom_histogram(mapping = aes(x = gdpPerCap), bins = 2)
## Warning: Removed 250 rows containing non-finite values (stat_bin).


ggplot(data = df) +
  geom_histogram(mapping = aes(x = gdpPerCap), bins = 100)
## Warning: Removed 250 rows containing non-finite values (stat_bin).


ggplot(data = df) +
  geom_histogram(mapping = aes(x = gdpPerCap), bins = 1000)
## Warning: Removed 250 rows containing non-finite values (stat_bin).

###############################################################
#Scatterplots
##############################################################
# Scatterplots are good for visualizing the relationship between 2 continuous variables. 
# For example, what's the relationship between primary education attainment and GDP per capita? 
# Let's make a scatterplot of GDP per capita vs. primary education attainment:
  
  ggplot(data = df) +
  geom_point(mapping = aes(x = educPri, y = gdpPerCap))
## Warning: Removed 1720 rows containing missing values (geom_point).


# Wow, what a mess! That's because we have so many data points being plotted over 
# each other (this is called overplotting). Are there more points in the 70-80% 
# range on the x-axis, or in the 95-100% range? It's hard to tell. One way to address 
# this is to modify the transparency of each point by adjusting "alpha". By default, alpha = 1,
# which represents being fully opaque. We can reduce alpha (alpha = 0.2 means that 5 points are 
#  needed to get full opacity). Notice that alpha is not within the aes brackets since it is not 
# determined by the data.

ggplot(data = df) +
  geom_point(mapping = aes(x = educPri, y = gdpPerCap), alpha = 0.2)
## Warning: Removed 1720 rows containing missing values (geom_point).

# 
# While alpha = 0.2 is probably too faint in this case, the characteristics of the data become more obvious.
# 
# We see that the scale on the y-axis is somewhat dominated by the points at the top.
# One way to make the points more spread out across the canvas is to perform a logarithmic
# transformation on the y-axis:
  
  ggplot(data = df) +
  geom_point(mapping = aes(x = educPri, y = log10(gdpPerCap)), alpha = 0.5)
## Warning: Removed 1720 rows containing missing values (geom_point).


# There certainly seems to be a positive relationship here, although the range in GDP per capita seems
# fairly wide when primary education attainment is very high.
# 
# Does the relationship change of we look at tertiary education attainment instead?
# We make this scatterplot below. Instead of filled circles, we could change the shape
# of the points manually through the shape argument (see this reference for which symbols
#   correspond to each shape value):
  
  ggplot(data = df) +
  geom_point(mapping = aes(x = educTer, y = log10(gdpPerCap)), shape = 4)
## Warning: Removed 1902 rows containing missing values (geom_point).

# 
# Let's explore another relationship: years of compulsory education vs. 
# GDP per capita. Let's start with a scatterplot:
#   
  ggplot(data = df) +
  geom_point(mapping = aes(x = compEduc, y = log10(gdpPerCap)))
## Warning: Removed 532 rows containing missing values (geom_point).

# 
# This is not very informative. We see a lot of overplotting going on: 
#   and that's because compEduc only takes on a few values. (Because of this, compEduc
#  can also be thought of as a categorical variable!) Let's use the alpha trick that we used previously:
  
  ggplot(data = df) +
  geom_point(mapping = aes(x = compEduc, y = log10(gdpPerCap)), alpha = 0.2)
## Warning: Removed 532 rows containing missing values (geom_point).

# 
# In this case, changing alpha on its own is not going to help much, since all the 
# points are still going to lie on one vertical line. Let's add jitter (i.e. move the points by a 
# small random amount) to get a better view.

ggplot(data = df) +
  geom_point(mapping = aes(x = compEduc, y = log10(gdpPerCap)), 
             alpha = 0.2, position = "jitter")
## Warning: Removed 532 rows containing missing values (geom_point).


# Because jittering is such a common operation, instead of adding position = "jitter" as an argument
# to geom_point(), we can use geom_jitter() directly to get the same plot:
  
  ggplot(data = df) +
  geom_jitter(mapping = aes(x = compEduc, y = log10(gdpPerCap)), 
              alpha = 0.2)
## Warning: Removed 532 rows containing missing values (geom_point).

############################################################################
  #Boxplots and violin plots
  
#################################################################################  
  # Because compEduc only takes on a few values, we can think of it as a categorical variable.
  # In the plots above, instead of plotting the individual points for each observation, we could draw a 
  # boxplot for each value of the categorical variable.
  
  # Because compEduc is a numeric variable, we need to pass factor(compEduc) to the geom_boxplot() function
  # instead so that it treats compEduc like a categorical variable:
    
    ggplot(data = df) +
    geom_boxplot(mapping = aes(x = factor(compEduc), y = log10(gdpPerCap)))
  ## Warning: Removed 250 rows containing non-finite values (stat_boxplot).
  
  
#  For a violin plot, use geom_violin():
    
    ggplot(data = df) +
    geom_violin(mapping = aes(x = factor(compEduc), y = log10(gdpPerCap)))
  ## Warning: Removed 250 rows containing non-finite values (stat_ydensity).
  

#########################################################################
    #Line plots
    
#########################################################################    
    # Let's say we want to look at how population changes over the time period that we have in our dataset.
    # A natural first try would be the following:
    #   
      ggplot(data = df) +
      geom_line(aes(x = year, y = log10(pop)))
    
    
    # What's going on here?? What's happening is that for each value of year, there are several 
    # rows associated with that value: one for each country! What we really want is one line per country. 
    # The way to achieve that is by specifying a group option:
      
      ggplot(data = df) +
      geom_line(aes(x = year, y = log10(pop), group = cty_code), alpha = 0.2)
    ## Warning: Removed 7 rows containing missing values (geom_path).
    
    # 
    # The plot shows that population doesn't change very much on the log scale,
    # as one might expect. Do we see the same trend with the percentage of the population between 0-14 years?
    
    ggplot(data = df) +
      geom_line(aes(x = year, y = popYoung, group = cty_code), alpha = 0.2)
    ## Warning: Removed 237 rows containing missing values (geom_path).
    
    
   # There seems to be a slight downward trend.
    
    # These plots are not that useful because we are showing data for all the countries on a single plot:
    #   it ends up making the plot look like a mess. It might be better to just look at
    # the trends for a handful of countries of interest.
    
   # Relationships between 3 or more variables
    # Is there a relationship between the total population of a country and the relative 
    # proportion of the country being < 15 years old? Let's make a scatterplot to find out:
      
      ggplot(data = df) +
      geom_point(aes(x = log10(pop), y = popYoung))
    ## Warning: Removed 237 rows containing missing values (geom_point).
    
    
    # That's an interesting looking plot! We see very clear streaks of points, suggesting that 
    # they belong to the same group. One way to test this is to color code the points by the 
    # country they belong to:
      
      ggplot(data = df) +
      geom_point(aes(x = log10(pop), y = popYoung), col = cty_code)
    ## Error in layer(data = data, mapping = mapping, stat = stat, geom = GeomPoint, : object 'cty_code' not found
      
    # What went wrong here? Because color depends on data, we should put it
    # within the aes() brackets. If col is outside the brackets, R interprets our intent 
    # as changing the color of all points to cty_code. But the variable cty_code does not
    # exist in our global environment, hence the error. This is the correct syntax:
      
      ggplot(data = df) +
      geom_point(aes(x = log10(pop), y = popYoung, col = cty_code))
    ## Warning: Removed 237 rows containing missing values (geom_point).
    
    # 
    # The legend ends up taking up the whole place of the plot. The code below can be used to remove
    # the legend (we'll learn more about themes next class):
      
      ggplot(data = df) +
      geom_point(aes(x = log10(pop), y = popYoung, col = cty_code)) +
      theme(legend.position = "none")
    ## Warning: Removed 237 rows containing missing values (geom_point).
    
    
    # Let's color the dots by year to see if there is a trend within each streak of dots:
      
      ggplot(data = df) +
      geom_point(aes(x = log10(pop), y = popYoung, col = year))
    ## Warning: Removed 237 rows containing missing values (geom_point).
    
    
    # Saving a plot
    # To save a plot, click on the  button, and click "Save as Image." You can adjust the size
     # of your image in the pop-up before saving it.
      

      
##################################################################################################
      
      data(diamonds)
      ?diamonds
##################################################################################################      
      
      #As usual, we can use str(), head() or View() to see the dataset:
        
        str(diamonds)
      
      ## Classes 'tbl_df', 'tbl' and 'data.frame':    53940 obs. of  10 variables:
      ##  $ carat  : num  0.23 0.21 0.23 0.29 0.31 0.24 0.24 0.26 0.22 0.23 ...
      ##  $ cut    : Ord.factor w/ 5 levels "Fair"<"Good"<..: 5 4 2 4 2 3 3 3 1 3 ...
      ##  $ color  : Ord.factor w/ 7 levels "D"<"E"<"F"<"G"<..: 2 2 2 6 7 7 6 5 2 5 ...
      ##  $ clarity: Ord.factor w/ 8 levels "I1"<"SI2"<"SI1"<..: 2 3 5 4 2 6 7 3 4 5 ...
      ##  $ depth  : num  61.5 59.8 56.9 62.4 63.3 62.8 62.3 61.9 65.1 59.4 ...
      ##  $ table  : num  55 61 65 58 58 57 57 55 61 61 ...
      ##  $ price  : int  326 326 327 334 335 336 336 337 337 338 ...
      ##  $ x      : num  3.95 3.89 4.05 4.2 4.34 3.94 3.95 4.07 3.87 4 ...
      ##  $ y      : num  3.98 3.84 4.07 4.23 4.35 3.96 3.98 4.11 3.78 4.05 ...
      ##  $ z      : num  2.43 2.31 2.31 2.63 2.75 2.48 2.47 2.53 2.49 2.39 ...
      
      head(diamonds)
      ## # A tibble: 6 x 10
      ##   carat cut       color clarity depth table price     x     y     z
      ##   <dbl> <ord>     <ord> <ord>   <dbl> <dbl> <int> <dbl> <dbl> <dbl>
      ## 1 0.23  Ideal     E     SI2      61.5    55   326  3.95  3.98  2.43
      ## 2 0.21  Premium   E     SI1      59.8    61   326  3.89  3.84  2.31
      ## 3 0.23  Good      E     VS1      56.9    65   327  4.05  4.07  2.31
      ## 4 0.290 Premium   I     VS2      62.4    58   334  4.2   4.23  2.63
      ## 5 0.31  Good      J     SI2      63.3    58   335  4.34  4.35  2.75
      ## 6 0.24  Very Good J     VVS2     62.8    57   336  3.94  3.96  2.48
      
  #############################################################################    
     # Practice
      
      # Let's practice some of the basic plotting that we learnt last session! 
      # (Note: Some of these plots may take a while to load as our dataset is quite big.)
      # 
      # Make a histogram of price. Vary the number of bins to see what happens.
      # Make a scatterplot of price vs. carat. Adjust the alpha to 0.05 to reduce overplotting.
      # Do you see any patterns in the data?
      # Make a boxplot of price for each value of cut, then make a violin plot instead.
      # How do these plots differ in the information that they give the reader?
      
###########################################################################################      
      #Bar plots
 #######################################################     
      # Bar plots are useful in describing how often each category appears for a categorical variable.
      # The code below makes a bar plot to show how many diamonds there are for each cut type:
        
        ggplot(data = diamonds, mapping = aes(x = cut)) +
        geom_bar()
      
      
      # Note that for shorter syntax, we can drop data = in ggplot() if our dataset is the first
      # argument within the braces. We can also drop mapping = if (i) it is the second argument within
      # the braces for ggplot(), or (ii) it is the first argument within the braces for the geom_xx() functions.
      # For example, the code below will give the same plot:
        
        ggplot(diamonds, aes(x = cut)) +
        geom_bar()
      
      
      # To make the bars horizontal instead, we can add coord_flip():
        
        ggplot(diamonds, aes(x = cut)) +
        geom_bar() +
        coord_flip()
      
############################################################################      
     # Layers
###############################################################################        
      # Layering allows us to make more sophisticated and informative plots. Let's go back to the 
      #   scatterplot of price vs. carat:
        
        ggplot(diamonds, aes(x = carat, y = price)) +
        geom_point(alpha = 0.05)
      
      
      # There certainly seems to be a positive relationship between the two, even though there
      # seems to be a lot of noise too. We can add a geom_smooth() layer that tries to smooth out the noise:
        
        ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
        geom_point(alpha = 0.05) +
        geom_smooth()
      ## `geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'
      
      
      # The heavier the diamond, the more expensive it is. At the same time,
      # we see quite a wide spread of prices for diamonds of the same weight, 
      # indicating that there are probably other factors at play.
      
      # Relationships between 3 or more variables: scales and facets
      # Let's go back to the boxplot of price for each value of cut:
        
        ggplot(diamonds, aes(x = cut, y = price)) +
        geom_boxplot()
      
      
      # It seems unintuitive that the cut of a diamond does not affect its price, and that diamonds of 
      # ideal cut have lower prices. Could there be other factors at work? One possibility is that there
      # just aren't many large diamonds of ideal cut: thus, a diamond of ideal cut tends 
      # to weigh less (smaller in carat size), and hence fetches a lower price.
      
      # We can explore this theory by modifying other aesthetics. For example, 
      # in the scatterplot of price vs. carat, we can let the color of each dot signify its cut:
        
        ggplot(diamonds, aes(x = carat, y = price, col = cut)) +
        geom_point(alpha = 0.2)
      
      
      # There seem to be more yellow dots on top and more purple dots below, lending credence to 
      # the intuitive assumption that better cut results in better quality. In this case, changing 
      # the color of the dots helped us to understand the data better.
      
      # The colors here are the R defaults. We can introduce our own color scale with scale_color_brewer()
      # to make the plot more informative (the full list of color palettes can be
      #                                    found through google image search):
        
        ggplot(diamonds, aes(x = carat, y = price, col = cut)) +
        geom_point(alpha = 0.2) +
        scale_color_brewer(palette = "YlOrRd")
      
      
      # There's still a fair amount of overplotting going on. Can we have separate
      # graphs of price vs. carat for each cut?
      # 
      # This is called splitting the plot into facets. R allows us to do this by
      # using the function facet_wrap(). Use the following code to facet the plot by a single variable:
        
        ggplot(diamonds, aes(x = carat, y = price, col = cut)) +
        geom_point(alpha = 0.2) +
        scale_colour_brewer(palette = "YlOrRd") +
        facet_wrap(~ cut)
      
      
      # By default, R put just 3 subplots in each row. We can change this by adding a
      # nrow argument to facet_wrap():
        
        ggplot(diamonds, aes(x = carat, y = price, col = cut)) +
        geom_point(alpha = 0.2) +
        scale_colour_brewer(palette = "YlOrRd") +
        facet_wrap(~ cut, nrow = 1)
      
      
      # Facetting didn't help too much in this case, since the plots for the better cuts
      # look very similar to one another. Perhaps we could add a smoothing layer to the original plot:
        
        ggplot(diamonds, aes(x = carat, y = price, col = cut)) +
        geom_point(alpha = 0.2) +
        scale_colour_brewer(palette = "YlOrRd") +
        geom_smooth()
      ## `geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'
      
      
      # As you can probably see, the possibilities are endless! You can try plotting 
      # different variables against each other and see if you get anything interesting.
      
      # If we want to facet by more than 1 variable, we can do so with facet_grid().
      # The variable before the ~ sign will be split on the rows, while the variable after
      # the ~ sign will be split on the columns:
        
        ggplot(diamonds, aes(x = carat, y = price)) +
        geom_point(alpha = 0.2) +
        facet_grid(cut ~ color)
      
      # 
      # Themes and non-data ink
      # Let's say you're satisfied with the scatterplot of price vs. carat with color denoting cut,
      # and that you want to share it with others. The first thing you should do is label your axes
      # and give your plot a title:
        
        ggplot(diamonds, aes(x = carat, y = price, col = cut)) +
        geom_point(alpha = 0.2) +
        scale_colour_brewer(palette = "YlOrRd") +
        labs(x = "Carat", y = "Price", title = "Plot of carat vs. price")
      
      # 
      # The size of the labels seems a bit small. We can adjust them using the theme() function. 
      # Let's centralize the plot title at the same time:
      #   
        ggplot(diamonds, aes(x = carat, y = price, col = cut)) +
        geom_point(alpha = 0.2) +
        scale_colour_brewer(palette = "YlOrRd") +
        labs(x = "Carat", y = "Price", title = "Plot of carat vs. price") + 
        theme(plot.title = element_text(size = rel(1.5), face = "bold", hjust = 0.5),
              axis.title = element_text(size = rel(1.2)))
      
      
      # We can move the legend around by setting a legend.position argument in theme() 
      # (possible options are "none", "left", "right", "bottom", "top"):
        
        ggplot(diamonds, aes(x = carat, y = price, col = cut)) +
        geom_point(alpha = 0.2) +
        scale_colour_brewer(palette = "YlOrRd") +
        labs(x = "Carat", y = "Price", title = "Plot of carat vs. price") + 
        theme(plot.title = element_text(size = rel(2), face = "bold", hjust = 0.5),
              axis.title = element_text(size = rel(1.5)),
              legend.position = "bottom")
      
      
      # Just about everything in the plot can be modified. For a full (long!)
      # list of attributes which can be modified, see this reference.
      
      # We can also try changing the overall theme of the plot and see if any of them make
      # the visualization more effective:
        
        ggplot(diamonds, aes(x = carat, y = price, col = cut)) +
        geom_point(alpha = 0.2) +
        scale_colour_brewer(palette = "YlOrRd") +
        labs(x = "Carat", y = "Price", title = "Plot of carat vs. price") + 
        theme(plot.title = element_text(size = rel(2), face = "bold", hjust = 0.5),
              axis.title = element_text(size = rel(1.5)),
              legend.position = "bottom") +
        theme_bw()
      
      # 
      # Notice how the legend is not at the bottom and that the plot and axis titles are back to 
      # the defaults? This is because we applied theme_bw() last. When we apply theme_bw(),
      # it overwrites all the changes to the theme that we specified in theme(). To avoid this overwrite,
      # we can simply reorder the code:
        
        ggplot(diamonds, aes(x = carat, y = price, col = cut)) +
        geom_point(alpha = 0.2) +
        scale_colour_brewer(palette = "YlOrRd") +
        labs(x = "Carat", y = "Price", title = "Plot of carat vs. price") + 
        theme_bw() +
        theme(plot.title = element_text(size = rel(2), face = "bold", hjust = 0.5),
              axis.title = element_text(size = rel(1.5)),
              legend.position = "bottom")
      
      
      #For a list of complete themes, see this link.
####################################################################################
     # Optional material
      
###################################################################################      
      # Assign plots to variables
        
        
      # It seems tedious to be changing these attributes for each graph we make. The nice thing about 
      # ggplot is that it lets us assign each part of the plot as a variable! For example, 
      # we could have reproduced the plot above using this code:
        
        p <- ggplot(data = diamonds, mapping = aes(x = carat, y = price, col = cut)) +
        geom_point(alpha = 0.2) +
        scale_colour_brewer(palette = "YlOrRd") +
        labs(x = "Carat", y = "Price", title = "Plot of carat vs. price")
      th <- theme(plot.title = element_text(size = rel(1.5), face = "bold", hjust = 0.5),
                  axis.title = element_text(size = rel(1.2)),
                  legend.position = "bottom")
      p  # plot without the theme changes
      
      
      p + th
      
      
      #I can now apply these adjustments to any plot I want by adding + th at the end of the code:
        
        ggplot(data = diamonds) +
        geom_histogram(mapping = aes(x = price)) + 
        labs(title = "Histogram of price", x = "Price", y = "Count") +
        th
      ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
      
###########################################################      
     # More on color scales
############################################################ 
        
      # The color scale functions in ggplot2 are of the form scale_x_y, where x is either
      # color or fill, and y is either brewer or distiller. color is for the outline while
      # fill is for the interior; brewer is when we have a discrete number of colors while
      # distiller is for continuous scales. For example, if we wanted to color the points based 
      # on price, we would use scale_color_distiller:
        
        ggplot(diamonds, aes(x = carat, y = price, col = price)) +
        geom_point(alpha = 0.2) +
        scale_color_distiller(palette = "YlOrRd")
      
      
      # Some of you might have picked up on an inconsistency here: didn't I say 
      # that scale_color_distiller is for the outline of the shape? Why then is 
      # the fill of the points in the plot above changing?
      
      #This has to with the shapes aesthetic. R has 26 in-built shapes:
        
        
        # Shapes 0-20 only have the col attribute while shapes 21-25 have both col and fill attributes.
        # We can see this in action when we change the shape aesthetic in the previous plot:
        
        ggplot(diamonds, aes(x = carat, y = price, col = price)) +
        geom_point(alpha = 0.2, shape = 21) +
        scale_color_distiller(palette = "YlOrRd")
      
      
      # It looks almost the same as before but if you look closely, the points have no fill in the interior.
      # The code below makes the fill black:
        
        ggplot(diamonds, aes(x = carat, y = price, col = price)) +
        geom_point(alpha = 0.2, shape = 21, fill = "black") +
        scale_color_distiller(palette = "YlOrRd")
      
      
      # Changing the x- and y-axis scales
      # Sometimes we may want to zoom in on a particular part of the plot. For example, 
      # look at the scatterplot of carat vs. z:
        
        ggplot(diamonds, aes(x = z, y = carat)) +
        geom_point(alpha = 0.2)
      
      
      # While the default plot shows us all the data, most of the plot is wasted space to accommodate
      # a single outlier. The following code allows us to define the limits of the x-axis (only from 1 to 8.5):
        
        ggplot(diamonds, aes(x = z, y = carat)) +
        geom_point(alpha = 0.2) +
        scale_x_continuous(limits = c(0, 8.5))
      ## Warning: Removed 1 rows containing missing values (geom_point).
      
      
     # R helpfully warns us that the one outlier was removed before plotting.
      
      # Instead of using scale_x_continuous(), we could also use coord_cartesian() 
      # to achieve the same effect:
        
        ggplot(diamonds, aes(x = z, y = carat)) +
        geom_point(alpha = 0.2) +
        coord_cartesian(xlim = c(0, 8.5))
      
      # 
      # Notice that in this case, R does not warn us about the outlier.
      # That is because the two functions works differently. With scale_x_continuous(),
      # R removes all points outside the limits, then plots them. With coord_cartesian(),
      # R plots all the points, then zooms in on the specified range. This difference might not seem
      # like a big deal but it can make a difference in some cases.
      # For example, the code below draws a jagged line:
        
        n <- 15
       df <- data.frame(x = cos(2 * pi * 1:n / n),
                       y = sin(2 * pi * 1:n / n))
      ggplot(df, aes(x = x, y = y)) +
        geom_line()
      
      
      #If we only want to zoom in on the part above the x-axis, coord_cartesian() does the right thing:
        
        ggplot(df, aes(x = x, y = y)) +
        geom_line() +
        coord_cartesian(ylim = c(0, 1))
      
      
      # scale_y_continuous(), on the other hand, does something funky. That's probably
      # not what we want in this case.
      
        ggplot(df, aes(x = x, y = y)) +
        geom_line() +
        scale_y_continuous(limits = c(0, 1))
      ## Warning: Removed 2 rows containing missing values (geom_path).
      
            

