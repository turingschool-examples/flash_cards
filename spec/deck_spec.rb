require 'rspec'
require './lib/card'
require './lib/deck'

describe Deck do

  describe '#initalize' do
        
    it 'exists' do 
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = ([card_1, card_2, card_3])
      deck = Deck.new(cards)

      expect(deck).to be_a Deck
    end

    it 'is contains an array of cards' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = ([card_1, card_2, card_3])
      deck = Deck.new([card_1, card_2, card_3])
            
      expect(deck.cards).to eq ([card_1, card_2, card_3])
    end

    it 'counts number of cards' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = ([card_1, card_2, card_3])
      deck = Deck.new([card_1, card_2, card_3])

      expect(deck.count).to eq 3
    end
  end

  describe '#cards_in_category' do
    it 'filters cards by :STEM category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = ([card_1, card_2, card_3])
      deck = Deck.new([card_1, card_2, card_3])

      expect(deck.cards_in_category(:STEM)).to eq [card_2, card_3]
    end
  end

  describe '#sort_categories' do
    it 'return array of unique categories' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = ([card_1, card_2, card_3])
      deck = Deck.new([card_1, card_2, card_3])
        
      expect(deck.sort_categories).to eq [:Geography, :STEM]
    end
  end
end

