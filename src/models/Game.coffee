class window.Game extends Backbone.Model

  initialize: (app) ->
    @set 'app', app
    @set 'player', @get('app').get('player')
    @set 'dealer', @get('app').get('dealer')
    @get('player').on 'stand', => @get('app').dealerTurn()

    winner = @get('app').initialCheck()
    if winner isnt 'continue' then @get('app').endGame(winner)

    @get('player').on 'hit', => @determineNextMove()

  determineNextMove: ->
    result = @get('player').isTwentyOne()
    if result then @get('app').dealerTurn()
    
    result = @get('player').isOverTwentyOne()
    if result then @get('app').endGame('dealer')