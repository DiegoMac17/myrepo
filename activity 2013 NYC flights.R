#Names:
#Diego Machado
#Robert Rayburn
#install.packages("nycflights13")

#1) 5 -> Airlines, Airports, Flights, Planes, Weather

#class(flights)
#2)data frame

#View(flights)
#3) 19 variables and 336776 variables

#4)
library(tidyverse)
library(nycflights13)
Jan1 <- flights %>% filter(month==1,day==1) 
dep_time_l2d <- Jan1[,4]%%100
dep_time_h <- Jan1[,4]-dep_time_l2d
dep_time <- dep_time_h*60+dep_time_l2d
arr_time_l2d <- Jan1[,7]%%100
arr_time_h <- Jan1[,7]-arr_time_l2d
arr_time <- arr_time_h*60+arr_time_l2d
total_time_min <- arr_time-dep_time
names(total_time_min) <- "total_time"
total_time_mod <- total_time_min%%60
total_time <- total_time_min/60+total_time_mod
total_time <- total_time - total_time%%1
total_time <- abs(total_time)
Jan1$. <- total_time
View(Jan1)