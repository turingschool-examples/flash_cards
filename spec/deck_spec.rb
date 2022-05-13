require 'rspec'
require './lib/card'
require './lib/deck'

describe 'Deck' do
    it "#initializes" do
      card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards =[card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.cards).to eq(cards)
    end
    it "can count cards in a deck" do
      card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards =[card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.count).to eq(3)
    end
    it "returns cards in a category" do
      card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      
      expect(deck.cards_with_category(:STEM)).to eq(cards[1..2])
    end
end
