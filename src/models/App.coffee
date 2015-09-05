# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'player', @get('deck').dealPlayer()
    @set 'dealer', @get('deck').dealDealer()
    @set 'gameModel', new Game(@)

  compareHands: ->
    bestPlayerHand = @player.bestHand()
    bestDealerHand = @dealer.bestHand()

    if bestDealerHand > bestPlayerHand
      'dealer'
    else if bestPlayerHand > bestDealerHand 
      'player'
    else
      'push'

  initialCheck: -> 
    if @dealer.isTwentyOne
      if @player.isTwentyOne
        'push'
      else
        'dealer'
    else if @player.isTwentyOne
      'player'
    else
      'continue'

  dealerTurn: ->


  endGame: ->


