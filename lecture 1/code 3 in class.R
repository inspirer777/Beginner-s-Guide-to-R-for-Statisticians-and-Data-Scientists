pie

?pie
pie(x, labels = names(x), edges = 200, radius = 0.8,
    clockwise = FALSE, init.angle = if(clockwise) 90 else 0,
    density = NULL, angle = 45, col = NULL, border = NULL,
    lty = NULL, main = NULL, ...)
data("iris")
View(iris
     )
pie(table(iris$Species))
library(sn
        )
install.packages(sn
                 )
install.packages("sn")
library(sn)
data(ais)
View(ais
     )
names(ais)
ais$sex
pie(table(ais$sex))
pie(table(ais$sport))
pie(table(ais$sport),col = gray (seq(from=0.5,to= 1,by=0.05)))
colors("cyan")
demo("colors")
?barplot
x<- rbinom(100,4,0.6)
f<- table(x)
barplot(f)
x
?binomial
f
barplot(f,horiz = T)  ### change columns
data("VADeaths")
VADeaths
barplot(VADeaths)
barplot(VADeaths,beside = T)
barplot(VADeaths,beside = T,legend= row.names(VADeaths))
barplot(VADeaths,beside = F)
ais
boxplot(ais$Wt)
boxplot(Wt~sport,ais)  ### ~ is model 
library(ggplot2)
#### hist ##### normal boodan 
hist(ais$Ht)  
hist(ais$Ht,probability = T,nclass = 80)
?plot()  ## is important 
attach(cars)
cars
## P is point , l is line## n is empty ## o,c,h,.... 
plot(dist,speed,type= "n")
plot(iris$Petal.Length,iris$Sepal.Width,type= "p") ## nemoodar parakanesh raftarha 
pairs(iris[1:4])
?data
x<-rnorm(1000)
plot(x,type= "l")
m<-cbind(rnorm(100),rnorm(100,2),rnorm(100,7))
m
plot(m)
matplot(m)  ## for matris
matplot(m,type="l")
qqnorm(x)
qqline(x,lw=2)
library("RColorBrewer")
display.brewer.all()
