#1#
library(ggplot2)
library(fueleconomy)
data(vehicles)
#2#
ggplot(vehicles, aes(x = cty, y = hwy)) +
  geom_point()

#3#
vehicles$cyl <- factor(vehicles$cyl)

#4#
ggplot(vehicles, aes(x = cty, y = hwy, col = cyl)) +
  geom_point() +
  scale_color_brewer(palette = "YlOrRd")
#5#
ggplot(vehicles, aes(x = year)) +
  geom_histogram()

#6#
ggplot(vehicles, aes(x = year)) +
  geom_histogram(bins = 5)
#7#
ggplot(vehicles, aes(x = cyl, y = hwy)) +
  geom_violin()
#8#
ggplot(vehicles, aes(x = cyl, y = hwy)) +
  geom_boxplot()
#9#
ggplot(vehicles, aes(x = fuel)) +
  geom_bar()
#10#
ggplot(vehicles, aes(x = fuel)) +
  geom_bar() +
  coord_flip()

#
data(vehicles)
vehicles <- vehicles[1:2000, ]
#11#
ggplot(vehicles, aes(x = cty, y = hwy)) +
  geom_point() +
  labs(title = "Scatterplot of highway mpg vs. city mpg", x 
       = "City mpg",
       y = "Highway mpg")
#12#
ggplot(vehicles, aes(x = cty, y = hwy, col = cyl)) +
  geom_jitter(alpha = 0.2) +
  labs(title = "Scatterplot of highway mpg vs. city mpg", x 
       = "City mpg",
       y = "Highway mpg")
#13#
ggplot(vehicles, aes(x = cty, y = hwy, col = cyl)) +
  geom_jitter(alpha = 0.2) +
  labs(title = "Scatterplot of highway mpg vs. city mpg", x 
       = "City mpg",
       y = "Highway mpg") +
  facet_wrap(~ cyl)
#14#
ggplot(vehicles, aes(x = cty, y = hwy, col = cyl)) +
  geom_jitter(alpha = 0.2) +
  labs(title = "Scatterplot of highway mpg vs. city mpg", x 
       = "City mpg",
       y = "Highway mpg") +
  facet_wrap(~ cyl, scales = "free")
#14-second #
ggplot(vehicles, aes(x = fuel)) +
  geom_bar() +
  theme_bw()
#15#
ggplot(vehicles, aes(x = drive, y = displ)) +
  geom_violin() +
  geom_jitter(alpha = 0.2)

#16#
ggplot(vehicles, aes(x = year, y = hwy)) +
  geom_jitter(alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE)
#17#
ggplot(vehicles, aes(x = year, y = hwy, col = fuel)) +
  geom_jitter(alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE) +
  theme_minimal() +
  theme(legend.position = "bottom")
