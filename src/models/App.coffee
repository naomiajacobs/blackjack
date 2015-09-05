# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'player', @get('deck').dealPlayer()
    @set 'dealer', @get('deck').dealDealer()
    @set 'gameModel', new Game(@)
    # @get('player').on 'add', => determineNextMove

  compareHands: ->
    bestPlayerHand = @get('player').bestHand()
    bestDealerHand = @get('dealer').bestHand()

    if bestDealerHand > bestPlayerHand
      'dealer'
    else if bestPlayerHand > bestDealerHand
      'player'
    else
      'push'

  initialCheck: ->
    if @get('dealer').isTwentyOne()
      if @get('player').isTwentyOne()
        'push'
      else
        'dealer'
    else if @get('player').isTwentyOne()
      'player'
    else
      'continue'

  dealerTurn: ->
    @get('dealer').reveal()
    while @get('dealer').isUnderSeventeen()
      @get('dealer').hit()
    if @get('dealer').isBetweenSeventeenAndTwentyOne()
      winner = @compareHands()
      @endGame(winner)
    else @endGame('player')

  endGame: (winner) ->
    console.log(winner)

