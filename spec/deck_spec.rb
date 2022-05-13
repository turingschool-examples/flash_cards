require 'rspec'
require './lib/card'
require './lib/deck'

describe 'Deck' do
    it  'exists' do
      deck = Deck.new()
      expect(deck).to be_a Deck
    end
    it "#initializes" do
      card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards =[card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.cards).to eq(cards)
    end
end
