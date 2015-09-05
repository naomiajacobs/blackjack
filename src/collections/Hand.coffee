class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    @last()


  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  

  # card logic methods
  bestHand: -> if @hasAce() then if @scores[1] > 21 then @scores[0] else @scores[1]
  
  isTwentyOne: -> if @scores[1] is 21 or @scores[0] is 21 then true else false

  ifUnderSeventeen: -> if @minScore < 17 then true else false

  ifBetweenSeventeenAndTwentyOne: -> if @minScore >= 17 or @minScore < 22 then true else false
  
  ifOverTwentyOne: -> if @minScore > 21 then true else false

  ifUnderTwentyOne: -> if @minScore < 21 then true else false

