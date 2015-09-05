# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.Game extends Backbone.Model
  initialize: (app) -> 
    @set 'app', app
    if @get('app').initialCheck isnt 'continue' then @get('app').endGame()


# game start: dealer has 2 cards, player has 2 cards


# START GAME
#if dealer has 21 (call dealerHand.isTwentyOne)
  #if player has 21 (call playerHand.isTwentyOne)
    #game pushes END
  #else 
    #dealer wins END
#else if player has 21 (call playerHand.isTwentyOne)
  #player wins END
#else


  # if player hits
    # add card
    # if player total < 21 (call playerHand.isUnderTwentyOne)
      # *** CALL RECURSION ***

    # if player total === 21 (call playerHand.isTwentyOne)
      # dealers turn
    # if player total > 21 (call playerHand.isOverTwentyOne)
      # player loses END
  # else player stands
    # dealers turn

# DEALERS TURN

# *** RECURSION ***
# if dealer < 17 (call dealerHand.isUnderSeventeen)
  # dealer hits
  # *** CALL RECURSION ***
# if dealer >= 17 && <= 21 (call dealerHand.isBetweenSeventeenAndTwentyOne)
  # dealer stands
  # compare dealer vs player END (call App.compareHands())
# if dealer > 21 (call dealerHand.isOverTwentyOne)
  # dealer loses END
