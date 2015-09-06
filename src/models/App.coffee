# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'player', @get('deck').dealPlayer()
    @set 'dealer', @get('deck').dealDealer()
    @set 'game', new Game(@)