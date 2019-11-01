##Notes for Readr

library(tidyverse)

#helpful stringr functions

x <- c("why", "video", "cross", "extra", "deal", "authority")
str_subset(x,"[aeiou]")

str_replace(x, "[aeiou]", "?")

str_remove(x, "e")

str_detect(x, "[aeiou]")

str_count(x, "[aeiou]")

str_length(x)

str_extract(x, "[aeiou]")

replace_vowels <- x %>% str_replace("[aeiou]", "?")
replace_vowels_all <- x %>% str_replace("[aeiou]", "?")

#How to concatenate
a <- ("a")
b <- ("b")
paste0(a,b)



#Read csv
inspections <- read_csv("http://594442.youcanlearnit.net/inspections.csv")

inspections <- inspections %>%
  rename(inspectionID = `Inspection ID`,
         DBA = `DBA Name`,
         AKA = `AKA Name`,
         license = `License #`,
         facility = `Facility Type`,
         inspectionDate = `Inspection Date`,
         inspectionType = `Inspection Type`)






