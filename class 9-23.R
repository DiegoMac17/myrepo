#Class9/23
#load library
library(tidyverse)


###Separate -> allows to separate, but if extra comma R freaks out
#so we use double spearte, first by school and location and then break down
#location by city and state
schools <- c("University of Missississippi, University, MS", "Mississippi State, Starkville, MS", "Southern, Hattiesburg, MS")

msSchools <- tibble(schools) %>%
  separate(schools,c("School","Location"), sep=",",extra="merge") %>%
  separate(Location, c("City", "State"), sep=",")
View(msSchools)

### Distinct & arrange
stateName <- midwest %>%
  select(state) %>% distinct() %>%
  arrange(desc(state))
View(stateName)

###Mutate ->create a new column or overwrite one
countyInfo_2 <-  midwest %>%
  group_by(state) %>% 
  select(state, poptotal, popdensity) %>%
  summarize_each(funs(mean, sd, n_distinct)) 
select(state, poptotal_mean, popdensity_mean, popdensity_n_distinct) %>%
  rename(mean_population = poptotal_mean, 
         mean_population_density = popdensity_mean,
         number_of_counties = popdensity_n_distinct) 
mutate(properState =
         case_when(state == "IL" ~ "Illinois", state == "IN" ~ "Indiana",
                   state == "MI" ~ "Michigan", state == "OH" ~ "Ohio",
                   state == "WI" ~ "Wisconsin"))
#case when is a logical test allows us to wrangle data ->value to assign,
#i.e. could be used when we need to for example search and replace
#tricky part, it must accoutn for all posible values, if not found set to NA!!
View(countyInfo_2)

###View mutate and case_when
studentData <- tibble( students = c("John", "Susie", "Joe", "Ryan", "Jane"), grades = c("B", "A", "D", "F", "C"))
studentData <- studentData %>%
  mutate(passFail = case_when(grades == "A" ~ "Pass",
                              grades == "B" ~ "Pass",
                              grades == "C" ~ "Pass",
                              TRUE ~ "Fail")) # for everthing else assume true and assing fail
View(studentData)

###Sample_n
state100 <- midwest %>% sample_n(100)
View(state100)

###Pull
#Without pull
popMean <- midwest %>% summarize(popMean = mean(poptotal))
View(popMean)

belowMean <- midwest %>% filter(poptotal < popMean)
View(belowMean)
#Whit Pull
popMeanPull <- midwest %>% summarize(popMean = mean(poptotal)) %>% pull
View(popMean)

belowMean <- midwest %>% filter(poptotal < popMeanPull)
View(belowMean)







  