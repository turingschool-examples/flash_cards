require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/round'
require './lib/deck'

RSpec.describe Round do
  describe 'class checks' do
    it 'is an instance of round' do
      deck = []
      round = Round.new(deck)
      expect(round).to be_a(Round)
    end

    it 'is an instance of turn' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      # require 'pry'; binding.pry
      expect(new_turn.class).to eq(Turn)
    end
  end

  # describe ''
end
