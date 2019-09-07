library(tidyverse)
test <- c(2,7,NA,3,NA) #assing vector to test
is.na(test) #returns all elements of test if NA true, if !NA false
test2 <- test %>% na.omit()
test %in% c(1:5) #select if a value is not in the vector

##adding to the iris dataset
?iris
class(iris)

myiris <- iris
View(myiris)

myiris$Petal.width
width <- myiris$Petal.width
class(width)
view(width)

myiris$total.Length <- myiris$Petal.Length
