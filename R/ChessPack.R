#' Data set and reference - Chess Game Dataset (Lichess)
#'
#' This is a set of just over 20,000 games collected from a selection of users
#'  on the site Lichess.org. This is a list of all columns in the raw data frame.
#'
#' @format a data frame with 20019 observations. Raw data games.csv contains 16 columns, cleaned data chess.small contains 7 columns:
#' \describe{
#'  \item{id}{Assigned ID for players}
#'  \item{rated}{(T/F)rated and unrated games}
#'  \item{created_at}{first move start time}
#'  \item{last_move_at}{last move end time}
#'  \item{turns}{number of moves in the game}
#'  \item{victory_status}{The method of winning, 'resign' or 'mate'}
#'  \item{winner}{who won the game 'white', 'black', 'draw'}
#'  \item{increment code}{Fischer-delay or sudden death}
#'  \item{white_id}{Chosen player ID (white)}
#'  \item{white_rating}{Ranking of player (white)}
#'  \item{black_iD}{Chosen player ID (black)}
#'  \item{black_rating}{Ranking of player (white)}
#'  \item{moves}{The entire set list of moves in each individual game}
#'  \item{opening_eco}{code for opening move sets}
#'  \item{opening_ame}{Name of opening move set}
#'  \item{opening_ply} {Number of moves in the opening phase}
#'  }
#'
#'  @source \url{https://www.kaggle.com/datasets/datasnaek/chess}?
"chess.small"
