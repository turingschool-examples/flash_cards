require './lib/card'
require './lib/deck'
require './lib/turn'
require 'pry'

RSpec.describe Deck do
  describe '#cards' do
    it 'has a deck of cards' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      # Is there a correct way to condence these long lines of arguments for each card instance? Would you do that?
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)

      expect(deck.cards).to eq([card_1, card_2, card_3])
      expect(deck.cards.count).to eq(3)
    end
  end

  describe '#cards_in_category' do
    it 'returns the cards from the same category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)

      expect(deck.cards_in_category(:STEM)).to eq([card_2, card_3])
      expect(deck.cards_in_category(:Geography)).to eq([card_1])
      expect(deck.cards[1].category).to eq(:STEM)
    end
  end

end
