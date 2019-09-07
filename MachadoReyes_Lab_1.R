#Diego Machado Reyes
#CSCI 390
#Lab 1

#libraries
library(tidyverse)
library(datasauRus)

#List the data frame's structure
str(datasaurus_dozen)
#output
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1846 obs. of  3 variables:
#   $ dataset: chr  "dino" "dino" "dino" "dino" ...
# $ x      : num  55.4 51.5 46.2 42.8 40.8 ...
# $ y      : num  97.2 96 94.5 91.4 88.3 ...
# - attr(*, "spec")=
#   .. cols(
#     ..   dataset = col_character(),
#     ..   x = col_double(),
#     ..   y = col_double()
#     .. )

#Specify a data frame's variable
unique(datasaurus_dozen$dataset)
#output
# > unique(datasaurus_dozen$dataset)
# [1] "dino"       "away"       "h_lines"    "v_lines"    "x_shape"   
# [6] "star"       "high_lines" "dots"       "circle"     "bullseye"  
# [11] "slant_up"   "slant_down" "wide_lines"

#Count datasets in the datasurus_dozen
datasaurus_dozen %>% count(dataset)

#Data visualization summary
#1
dino_data <- datasaurus_dozen %>% filter(dataset=="dino") #Filter the observations for dino
dino_data %>% ggplot(mapping = aes(x=x,y=y))+geom_point(color = "blue") #Plot dataset, assign variables and color for plot/
dino_data %>% summarize(r=cor(x,y)) #Calculate the correlation coefficient. (In this case the relationship between x and y is nonlinear)
#Output
# # A tibble: 1 x 1
# r
# <dbl>
#   1 -0.0645

#2
star_data <- datasaurus_dozen %>% filter(dataset=="star")
star_data %>% ggplot(mapping = aes(x=x,y=y))+geom_point(color = "blue")
star_data %>% summarize(r=cor(x,y))
#Output
# # A tibble: 1 x 1
# r
# <dbl>
#   1 -0.0630
#The correlation between x and y for the circle is not very different from the dino -> 0.00x

#3
circle_data <- datasaurus_dozen %>% filter(dataset=="circle")
circle_data %>% ggplot(mapping = aes(x=x,y=y))+geom_point(color = "blue")
circle_data %>% summarize(r=cor(x,y))
#Output
# # A tibble: 1 x 1
# r
# <dbl>
#   1 -0.0683
#The correlation between x and y for the circle is not very different from the dino or the star -> 0.00x

#Plot all the dataset in datasaurus_dozen
datasaurus_dozen %>% ggplot(aes(x=x,y=y,color = dataset)) + geom_point()+ facet_wrap(~dataset,ncol=3)


