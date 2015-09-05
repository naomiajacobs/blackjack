assert = chai.assert

describe 'hand', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'determine Next Move', ->
    it 'should call dealer turn when player is 21', ->
      assert.strictEqual deck.last(), hand.hit()
