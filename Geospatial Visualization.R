#Geospatial Visualization
#10/25

#load libraries
library(tidyverse)
library(leaflet)
#install.packages("maps")
#install.packages("mapproj")
library(maps)
library(mapproj)
library(socviz)
#install.packages("usmap")
library(usmap)
install.packages("cowplot")
library(cowplot)


#use maps
world <- map_data("world")
world2 <- map_data("world2")
world2 %>% ggplot(aes(long,lat, group=group)) +
  geom_polygon(color = "black", fill = "white") +
  coord_map()

#map of the us in mercator
us_states <- map_data("state")
us_states %>%
  ggplot(mapping = aes(x=long,
                       y=lat,
                       group = group)) +
  geom_polygon(color="black",
               fill = "white") +
  coord_map()

#map of the us in albers
us_states %>%
  ggplot(mapping = aes(x=long,
                       y=lat,
                       group = group)) +
  geom_polygon(color="black",
               fill = "white") +
  coord_map(projection = "albers",lat0=39, lat1=45)


#left joins
#left_join(map,dataset)
View(election)
View(us_states)

election2016 <- election %>%
  mutate(region = tolower(state)) %>%
  select(-state)

#this allows for comparing spelling.
#Need to wrangle data if spellings are different
#Note number of observations in election 2016
comparison <- us_states %>%
  distinct(region) %>%
  arrange(region)
comparisonelection <- election %>%
  distinct(state) %>%
  mutate(state = tolower(state)) %>%
  arrange(state)

#see this are different, first one gives 0 because Alaska and Hawaii, depends on 
#comaprison order
stateRegions <- setdiff(comparison$region, comparisonelection$state)

electionStates <- setdiff(comparisonelection$state, comparison$region)

#now, convert election "state" to "region" in order to do a left_join
results <- left_join(us_states,election2016)

left_join(us_states, election2016) %>%
  ggplot(mapping = aes(x = long,
                       y = lat,
                       group = group,
                       fill = party)) +
  geom_polygon(color = "gray") +
  coord_map(projection = "albers",
            lat0 = 39,
            lat1 = 45) +
  guides(fill = FALSE) +
  scale_fill_manual(values = c("blue", "red"))

#Use usmap package -> as a plot_usmap function
#Includes Alaska & Hawaii
plot_usmap(regions = "states", data=election2016, values = "winner", labels = TRUE) +
  scale_fill_manual(values = c("blue", "red"))


#Alternate way for more control on map
us_states_v2<- us_map(region = "states") %>%
  rename(long = x,
         lat = y,
         st = abbr)
View(us_states_v2)

results_v2 <- left_join(us_states_v2,election2016, by="st")

left_join(us_states_v2, election2016, by = "st") %>%
  ggplot(mapping = aes(x = long,
                       y = lat,
                       group = group,
                       fill = party)) +
  geom_polygon(color = "gray") +
  coord_equal() + #sets aspect ratio height/width -> 1/2
  theme_map() + #
  guides(fill = FALSE) +
  scale_fill_manual(values = c("blue", "red")) 

#adding centroids

#Need map data with BOTH map and data
election_map <- left_join(us_states_v2, election2016, by = "st")

#Bind longitude and latitude to a variable  pct_margin (% margin by which Clinton/Trump won)
centroid <- aggregate(data = election_map, cbind(long, lat) ~ pct_margin, FUN=mean)

#Add geom_text layer to plot

election_map %>%
  ggplot(mapping = aes(x = long,
                       y = lat,
                       group = group,
                       fill = party)) +
  geom_polygon(color = "gray") +
  coord_equal() + #sets aspect ratio height/width -> 1/2
  theme_map() + #
  guides(fill = FALSE) +
  scale_fill_manual(values = c("blue", "red")) +
  geom_text(data = centroid, 
            mapping = aes(x = long,
                          y = lat,
                          label = pct_margin), 
            color = "yellow", size = 3) 



### Obesity example ###
obesity <- read_csv("ObesityYouthRisk.csv", col_names = TRUE)

#change legned to only one row and place ath the bottom
#+guides(fill= guide_legend(nrow=1)) + theme(legend.position ="botom")

