rock_paper_scissors <- function(user_play) {
    
  ## The aim of the function is to return a phrase saying
  # what you played, what the computer played, and who won.

  ## The possible plays
  legal_plays   <- c("rock", "paper", "scissors")


  ##### COMPLETE THE FOLLOWING #####
  # Make sure the input is of length one (complete the condition of the if statement)
  input_length <- TRUE ## REVISE!!
  if (input_length) {
    stop("Sorry, I did not understand that. Please input one word only")
  }
  ##################################

  # Make sure the input is one of the 3 possible choices
  # The %in% operand checks if the element on the left is present in the vecotr on the right, and returns TRUE or FALSE
  if (!(user_play %in% legal_plays)) {
    stop(paste("Sorry, I did not understand that. Input has to be: ", paste(legal_plays, collapse=" or ")))
  }


  ## The computer's play
  computer_play <- sample(x=legal_plays, size=1)


  ##### COMPLETE THE FOLLOWING #####
  # You will have to store the game results to a variable called game_result

  # If the user wins, write "You win." to game_result          # game_result <- "You win."
  # If the user loses, write "You lose." to game_result.       # game_result <- "You lose."
  # If there is a draw, write "Draw." to game_result.          # game_result <- "Draw."

  # Remember, rock wins against scissors, scissors win against paper, and paper wins against rock.
  # For example, if the user plays rock,
    # she/he wins if the computer plays scissors,
    # she/he loses if the computer plays paper
    # she/he draws if the computer plays rock

  # HINT: This may require many "if/else" statements

  # Return the game_result
  phrase_to_return <- paste("You played ", user_play, "; the computer played ", computer_play, ". ", game_result, sep='')
  return(phrase_to_return)

  ###### NOTE #######
  ## Marking is done automatically.
  ## Please return the exact phrase we ask you to!
  ###### NOTE #######

}
