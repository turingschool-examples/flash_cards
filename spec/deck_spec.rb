require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  describe 'class' do
    it 'is an instance of deck' do
      cards = []
      # card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      deck = Deck.new(cards)
      expect(deck).to be_a(Deck)
    end
  end
  describe 'has cards' do
    it 'can hold several cards' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      expect(cards).to eq([card_1, card_2, card_3])
      # require 'pry'; binding.pry
    end
  end
  describe 'tally the cards' do
    it 'can count the number of cards' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      expect(deck.count).to eq(3)
      # require 'pry'; binding.pry
    end
  end
  describe 'sorts cards' do
    it 'by category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      expect(deck.cards_in_category(:STEM)).to eq([card_2, card_3])
      # require 'pry'; binding.pry
    end
    it 'by different category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      expect(deck.cards_in_category(:Geography)).to eq([card_1])
      # require 'pry'; binding.pry
    end
  end
end
