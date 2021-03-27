require 'RSpec'
require './lib/card'
require './lib/deck'

describe Deck do
  describe '#initialize' do
    deck = Deck.new(0, :STEM)
    it 'is a deck' do
     expect(deck).to be_instance_of(Deck)
    end

    it 'has cards' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      expect(deck.cards).to eq []
    end
  end
end
#
