require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'
require 'pry'

RSpec.describe Deck do
  it 'deck variable exists with 3 cards' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      expect(deck).to be_a Deck
  end
end
