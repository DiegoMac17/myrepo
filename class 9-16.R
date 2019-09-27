#Class 9/16/2019
#DPLYR & TIDYR

##NOTE: if you assign and view on same line it won't assign variable

library(tidyverse)
library(praise)

data <- c(1,3,4,7,11,13,17)
data_diff <- diff(data)
mean(data_diff)

rep(praise(), 10)
data %>% diff %>% mean %>% rep(praise(),times=.)

###
myMidwest <- midwest
class(midwest)
glimpse(myMidwest)
View(myMidwest)

#Filter – Choose Rows Matching Criteria
midwest %>%
  select(state) %>%
  unique() %>%
  .[[1]]
ohio <- myMidwest %>% 
  filter(state=="OH")
View(ohio)
#Filter by small towns
ohioSmall <- myMidwest %>%
  filter(state=="OH" & poptotal < 25000)
View(ohioSmall)
#Select – Choose Columns by Name
#Obtain data frame with columns of population by ehtnicity
ohioethnicity <- myMidwest %>%
  filter(state=="OH" & poptotal < 25000) %>%
  select(poptotal, popwhite, popblack, popamerindian, popasian, popother)
View(ohioethnicity)
#Same as previous, however can be faster by doing range of columns minus the odd one
ohioethnicity_2 <- myMidwest %>%
  filter(state=="OH" & poptotal < 25000) %>%
  select(poptotal:popother, -popdensity)
View(ohioethnicity_2)

#slice
#create subset
ohioethnicity_3 <- myMidwest %>%
  slice(5, 7:11)
View(ohioethnicity_3)
#last 2 entries of list of midwest
lastEntry <- myMidwest %>%
  slice((nrow(.)-1): nrow(.))
View(lastEntry)

#Count
#first group by states and then count the Counties for each state
numCounties <- myMidwest %>%
  group_by(state) %>%
  count(state)
View(numCounties)


#Summarize
#the mean for pop total is a column mean
ohiopopInfo <- myMidwest %>%
  filter(state == "OH") %>%
  summarize(popMean = mean(poptotal),
            popWhiteMean = mean(popwhite),
            popBlackMean = mean(popblack),
            popAmerIndMean = mean(popamerindian), 
            popAsianMean = mean(popasian),
            popOtherMean = mean(popother))
View(ohiopopInfo)

#summarize each
countyInfo_2 <- myMidwest %>%
  group_by(state) %>%
  select(state, poptotal, popdensity) %>%
  summarize_each(funs(mean,sd,n_distinct)) %>%
  select(state,PID_mean)


