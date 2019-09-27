##Notes for Readr

#helpful stringr functions

x <- c("why", "video", "cross", "extra", "deal", "authority")
str_subset(x,"[aeiou]")

str_replace(x, "[aeiou]", "?")

str_remove(x, "e")

str_detect(x, "[aeiou]")

str_count(x, "[aeiou]")

str_length(x)

str_extract(x, "[aeiou]")