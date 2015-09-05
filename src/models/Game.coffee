class window.Game extends Backbone.Model

  initialize: (app) ->
    @set 'app', app
    @set 'player', @get('app').get('player')
    @set 'dealer', @get('app').get('dealer')
    @get('player').on 'stand', => @dealersTurn()

    if @get('app').initialCheck isnt 'continue' then @get('app').endGame()

    @get('player').on 'add', => @determineNextMove

  determineNextMove: ->
    result = @player.isTwentyOne()
    if result then @get('app').dealerTurn()
    
    result = @player.isOverTwentyOne()
    if result then @get('app').endGame()
    return

  dealersTurn: ->
    console.log("test")





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
    # if player total < 21 (call playerHand.ppisUnderTwentyOne)
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
