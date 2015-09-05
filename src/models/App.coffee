# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

#compareHands
  compareHands: -> if
    bestPlayerHand = @get('playerHand').bestHand()
    bestDealerHand = @get('dealerHand').bestHand()

    if bestDealerHand > bestPlayerHand
      'dealer'
    else if bestPlayerHand > bestDealerHand 
      'player'
    else    
      'push'


