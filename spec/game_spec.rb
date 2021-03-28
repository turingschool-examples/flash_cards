require './lib/game'
require './lib/round'
require './lib/card'
require './lib/deck'
require './lib/turn'

RSpec.describe Game do

  describe '#initialize' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    game = Game.new(round)

    it 'is a game' do
      expect(game).to be_a Game
    end

    it 'has a round' do
      expect(game.round).to be_a Round
    end
  end
end
