## answer of lecture 3 ##
## 1
x<-c(60,85,37,75,93,7,98,63,41,90,5,17,97)
x
stem(x)
## 2 
z<-c(80,82,88,91,91,95,95,97,98,101,106,106,109,110,111)
hist(z)
##3
x = rnorm(100) 
n= rnorm(100:0)
hist(n)
hist(x)
##4
library(UsingR)
data("crime")
names(crime)
attach(crime)
boxplot(y1983,main="1983",horizontal=TRUE)
boxplot(y1993,main="1993",horizontal=TRUE)
hist(y1983,15,prob=T)
hist(y1993,15,prob=T)
detach(crime) 
data("south")
names(south)
attach(south) #'attach' only works for lists, data frames and environments
data("aid")
names(aid)
attach(aid) ##'attach' only works for lists, data frames and environments
### 5  ###
data(math)
names(math)
hist(math)
mean(math)
sd(math)
median(math)
data(firstchi)
names(firstchi)
hist(firstchi)
mean(firstchi)
sd(firstchi)
median(firstchi)
data(bumpers)
names(bumpers)
hist(bumpers)
mean(bumpers)
sd(bumpers)
median(bumpers)
####  6  ####
t<-c(0, 1, 0, NA, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 3, 0, 0, 0, 0, 0,2,0,1)
table(t)
mean(t,na.rm = TRUE)

### 7 ###
o<-c(pi2000)
o
hist(o,probability = TRUE)
## 8 ##
hist( o )
simple.freqpoly(pi2000)


