library(tidyverse)

#create bar chart of ranked matches vs un-ranked matches
ggplot(chess, aes(x=reorder(rated, rated, function(x)-length(x)))) +
  geom_bar(fill='steelblue') +
  labs(x='Ranked Matches', title = 'Rated Matches vs Un-Rated Matches')
# ranked vs un-ranked wins between black and white
rated.wins <- chess %>% count(rated, winner, sort = TRUE)
rated.wins
