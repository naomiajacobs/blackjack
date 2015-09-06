class window.Game extends Backbone.Model

    initialize: (app) ->
        @set 'app', app
        @set 'player', @get('app').get('player')
        @set 'dealer', @get('app').get('dealer')
        @get('player').on 'hit', => @playerHit()
        @get('player').on 'stand', => @playerStand()
        @start()

    endGame: (winner) -> alert("#{winner} won!")

    busted: (person) -> if person.minScore() > 21 then true else false

    blackjack: (person) -> if person.bestHand() is 21 then true else false

    start: ->
        if @blackjack(@get('player'))
            if @blackjack(@get('dealer'))
                @endGame('push')
            else @endGame('player')
        else if @blackjack(@get('dealer'))
            @endGame('dealer')

    compare: ->
        if @busted(@get('player'))
            @endGame('dealer')
        else if @get('dealer').bestHand() > @get('player').bestHand()
            @endGame('dealer')
        else if @get('player').bestHand() > @get('dealer').bestHand()
            @endGame('player')
        else @endGame('push')

    playerHit: ->
        if @busted(@get('player')) then @endGame('dealer')

    playerStand: ->
        @get('dealer').reveal()
        if @get('dealer').minScore() > 16
            @compare()
        else
            while @get('dealer').minScore() < 17
                @get('dealer').hit()
            if @busted(@get('dealer')) then @endGame('player')
            else @compare()
