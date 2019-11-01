#important for data visualization

#install RColorBrewer package
install.packages(RColorBrewer)
library(RColorBrewer)
#discrete vs Continuous data

#Layer scales_ in ggplot

#Discrete: scale_color_brewer(palette="name")
#Filling: scale_fill_brewer(palette="name")

#Continuous: scale_color_distiller(palette="name")
#scale_fill_distiller(palette="name")

#if this is not working, then 
#scale_color_manual(values=myvar)
#myvar <- c("#RGB","#RGB") #hex value
#second option:
#myvar <- palette(n=3, name="Dark2") #where n is the ammoun of colors from "Dark2"

library(tidyverse)
myiris <- as_tibble(iris)

#discrete
myiris %>% group_by(Species) %>%
  summarise(avg = mean(Petal.Length)) %>%
  ggplot() + geom_bar(mapping=aes(x=Species, y=avg, fill=Species), stat="identity")+
  themepanel.background = element_blank()

#continuous
myiris %>% ggplot()+
geom_point(mapping = aes(x=Petal.Width, y=Petal.Length, color=Species)) +
  facet_wrap(~Species)+ scale_color_brewer(palette="Set2")

myColors_v2 <- palette(brewer.pal(n=3, name = "Spectral"))
myiris %>% ggplot()+
  geom_point(mapping = aes(x=Petal.Width, y=Petal.Length, color=Species)) +
  facet_wrap(~Species)+ scale_color_brewer(values=myColors_v2)

cars <-as_tibble(mtcars)
class(cars)
cars %>%  group_by(cyl)%>%
  summarise(avg=mean(hp))%>%
  ggplot()+
  geom_col(mapping = aes(x=cyl, y=avg, fill=cyl))+
  scale_fill_distiller(palette="Set1")



### box plot ###
install.packages("socviz")
library(socviz)
organdata %>%
  ggplot() +
  geom_boxplot(mapping = aes(x = country,
                             y = donors,
                             fill= country))

crimeTypesByYear <- crimes %>%
  select(YEAR, OFFENSE_CODE_GROUP) %>%
  group_by(YEAR, OFFENSE_CODE_GROUP) %>%
  count() %>%
  ungroup() 
crimeTypesByYear %>%
  ggplot() +
  geom_boxplot(mapping = aes(x = reorder(OFFENSE_CODE_GROUP, n),
                             y = n,
                             fill = OFFENSE_CODE_GROUP)) +
  guides(fill = FALSE) +
  coord_flip()

### bar chart ###
crimes %>%
  ggplot() +
  geom_bar(mapping = aes(x=OFFENSE_CODE_GROUP),
           bins = 4,
           fill = "blue",
           color = "black") +
  theme(panel.background = element_blank())


crimes %>%
  filter(OFFENSE_CODE_GROUP == c("Larceny", "Vandalism", "Medical Assistance", "Fraud")) %>%
  mutate(YEAR = as.integer(YEAR)) %>%
  ggplot() +
  geom_bar(mapping = aes(x=YEAR, fill = OFFENSE_CODE_GROUP)) +
  facet_wrap( ~   YEAR, scales = "free_y") +
  theme(axis.text.x = element_blank())


geom_bar(mapping = aes(x=YEAR, fill = OFFENSE_CODE_GROUP),position = "dodge")

### histograms ###
college %>%
  ggplot() +
  geom_histogram(mapping = aes(x = tuition, fill = control))
#Designate 5 bins
college %>%
  ggplot() +
  geom_histogram(mapping = aes(x = sat_avg,fill = control),bins = 5) +
  scale_fill_brewer(palette = "Set1")







