###using diff function
data <- c(1,3,5,7,11,13,17)
x <- diff(data)
y <- diff(data,differences = 2)
z <- diff(data,2)



#tibble
library(tidyverse)
class(iris)
iris_tibble <-as_tibble(iris)
class(iris_tibble)