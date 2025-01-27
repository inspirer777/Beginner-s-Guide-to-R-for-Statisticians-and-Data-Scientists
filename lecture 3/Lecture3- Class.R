?pie()
pie(x, labels = names(x), edges = 200, radius = 0.8,
    clockwise = FALSE, init.angle = if(clockwise) 90 else 0,
    density = NULL, angle = 45, col = NULL, border = NULL,
    lty = NULL, main = NULL, ...)
data("iris")
View(iris)
pie(table(iris$Species))

library(sn)
data(ais)
View(ais)
names(ais)
ais$sport
pie(table(ais$sport))

pie(table(ais$sport),col = gray(seq(from=0.5, to= 1, by=0.05)))

colors("cyan")
?colors()
demo("colors")
?rbinom
?barplot()
x<-rbinom(100,4,0.6)
f<-table(x)
barplot(f)

barplot(f,horiz = T)

data("VADeaths")
View(VADeaths)
VADeaths
barplot(VADeaths)
barplot(VADeaths,beside = T,legend=row.names(VADeaths))
ais

boxplot(ais$Wt)
boxplot(Wt~sport,ais)


ggplot(data = ais) +theme_bw()+
  geom_boxplot(mapping = aes(x = sport, y = Wt))

hist(ais$Ht)
hist(ais$Ht,prob=T,nclass = 80)

?plot()
attach(cars)
plot(dist,speed,type="p")#noghteie
plot(dist,speed,type="l")
plot(dist,speed,type="b")
plot(dist,speed,type="c")
plot(dist,speed,type="n")

plot(iris$Petal.Length,iris$Sepal.Width,type="p")

pairs(iris[1:4])

x<-rnorm(1000)
plot(x,type="l")
M<-cbind(rnorm(100,-2),rnorm(100,2),rnorm(100,7))

plot(M)


matplot(M,type="l")
qqnorm(x)
qqline(x,lw=2)
