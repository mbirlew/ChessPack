str(chess.small)
library(tidyverse)
library(ggplot2)
library(alr4)
library(knitr)
library(readr)
library(mgcv)

# turn opeing plays into factors
chess.small<- chess.small %>%
  mutate(opening_eco=factor(opening_eco))
# plot opening moves to winner
ggplot(chess.small, aes(x=opening_eco)) +
  geom_bar(aes(color=winner))

chess.sort <- chess.small %>%
  mutate(sort.int(opening_eco))

ggplot(chess.sort, aes(x=opening_eco)) +
  geom_bar(aes(color=winner))


# Convert data to probability table
data_perc <- t(prop.table(table(chess.small$opening_eco))) * 100
barplot(data_perc, xlab= 'Opening Move',ylab = "Percent of Opening moves")
# wins vs opening moves
opening.wins <- chess.small %>% count(opening_eco, winner, sort = TRUE)
#opening.wins
# number of wins by grouping opening moves
ggplot(opening.wins, aes(x=n)) +
  geom_bar(aes(color=winner))+
  labs(x ='Win Count', title = 'Number of Wins by Grouped Opening Moves')

# convert data_per to d.f.
tab <- as.data.frame(data_perc)

ggplot(tab, aes(x=Var1)) +
  geom_bar(aes(color=winner))

#test
P <- proportions(table(chess.small$opening_eco, margin=2))
ggplot(as.data.frame(P), aes(x=black)) +
  geom_bar(aes(color=winner))

P
