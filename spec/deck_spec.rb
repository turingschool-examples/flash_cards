require 'RSpec'
require './lib/card'
require './lib/deck'

describe Deck do
  describe '#initialize' do
    deck = Deck.new(0)
    it 'is a deck' do
     expect(deck).to be_instance_of(Deck)
    end

    it 'has cards' do
      expect(deck.cards).to eq []
    end

    it 'can count cards' do
     expect(deck.count).to eq 0
    end

    it 'reads the cards' do
     expect(deck.cards_in_category).to eq []
    end
  end

  describe '#add_cards' do
    it 'can add cards' do
      deck = Deck.new(0)
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck.add_cards(card_1)
      deck.add_cards(card_2)
      deck.add_cards(card_3)
      expect(deck.cards).to eq [card_1, card_2, card_3]
    end
  end

  describe '#count_cards' do
    it 'can count cards' do
     deck = Deck.new(0)
     card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
     card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
     deck.add_cards(card_1)
     deck.add_cards(card_2)
     deck.add_cards(card_3)
     expect(deck.count_cards).to eq 3
    end
  end

  describe '#cards_in_category' do
    it 'reads the cards' do
      deck = Deck.new(0)
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck.add_cards(card_1)
      deck.add_cards(card_2)
      deck.add_cards(card_3)
     expect(deck.cards_in_category).to eq [:STEM]
    end
  end
end
