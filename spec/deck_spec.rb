require 'rspec'
require './lib/card'
require './lib/deck'


describe Deck do
  describe 'initialize' do
    it 'initializes with an array of card objects' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
        and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5°
        clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      expect(deck.cards).to eq([card_1, card_2, card_3])
      expect(deck.stem_cards).to eq([card_2, card_3])
      expect(deck.geography_cards).to eq([card_1])
    end
  end
  #
  describe 'count method' do
    it 'counts how many cards in the deck' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
        and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5°
        clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      expect(deck.count).to eq (3)
    end
  end

  describe 'cards_in_category method' do
    it 'returns the cards in the specified category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
        and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5°
        clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      expect(deck.cards_in_category(:STEM)).to eq ([card_2, card_3])
      expect(deck.cards_in_category(:Geography)).to eq ([card_1])
      expect(deck.cards_in_category("Pop Culture")).to eq ([])
    end
  end

end
