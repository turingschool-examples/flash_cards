require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  before do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(cards)
  end

  describe '#deck initialization' do
    it 'is an instance of Deck' do
      expect(@deck).to be_instance_of(Deck)
    end

    it 'contains 3 cards when initialized' do
      expect(@deck.cards).to eq([@card_1, @card_2, @card_3])
      expect(@deck.cards.length).to eq(3)
    end
  end

  describe '#deck count' do
    it 'counts the number of cards in the deck' do
      expect(@deck.count).to eq(3)
    end
  end

  describe '#deck cards_in_category' do
    it 'selects all cards in a category' do
      expect(@deck.cards_in_category(:Geography)).to eq([@card_1])
      expect(@deck.cards_in_category(:Geography).count).to eq(1)
    end

    it 'selects all cards from another category' do
      expect(@deck.cards_in_category(:STEM)).to eq([@card_2, @card_3])
      expect(@deck.cards_in_category(:STEM).count).to eq(2)
    end

    it 'does not select cards from the wrong category' do
      expect(@deck.cards_in_category(:STEM)).to_not eq([@card_1])
    end
  end
end
