library(tidyverse)

# read in data
chess <- read.csv('data-raw/games.csv')

# remove unused columns
chess.tidy <- chess%>% select(-id,-created_at,-last_move_at,-white_id,-black_id,
                              -white_rating,-black_rating,-moves,-opening_name)

# created dummy variables (rated true=1, false=0)
chess.data <- subset(chess.tidy, victory_status != 'resign'&
                       victory_status != 'draw' &
                       victory_status != 'outoftime')%>%
  # (rated true=1, false=0)
  mutate(rated=ifelse(rated == 'TRUE',1,0))%>%
  # (winner white=1, black=0)
  mutate(winner2=ifelse(winner == 'white',1,0))%>%
  # separate time increment into time and delay
  separate(increment_code, sep = "\\+", into=c('set_time','delay'), remove = TRUE)%>%
  # if the delay is 0 then the game is sudden death (sudden death = 0, fischer delay = 1)
  mutate(game_type=ifelse(delay == '0',0,1))%>%
  # transform opening_eco to numeric data
  transform(opening_eco = as.numeric(as.factor(opening_eco)))

chess.small <- chess.data%>%select(-set_time,-delay)

# save data fram to data/ directory as chess.small
usethis::use_data(chess.small, overwrite = TRUE)
