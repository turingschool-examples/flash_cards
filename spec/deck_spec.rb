require 'rspec'
require './lib/card'
require './lib/deck'


RSpec.describe Deck do

  describe '#initialize' do
    it 'exists' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
      card_3 = Card.new("Which German philosopher greatly influenced Karl Marx?", "Hegel", :Philosophy)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)

      expect(deck).to be_instance_of(Deck)
      expect(deck.cards).to eq([card_1, card_2, card_3])
    end
  end

  describe '#count' do
    it 'has a correct count' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
      card_3 = Card.new("Which German philosopher greatly influenced Karl Marx?", "Hegel", :Philosophy)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)

      expect(deck.count).to eq(3)
    end
  end

  describe '#cards_in_category' do
    it 'correctly seperates cards by category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
      card_3 = Card.new("Which German philosopher greatly influenced Karl Marx?", "Hegel", :Philosophy)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)

      expect(deck.cards_in_category(:Geography)).to eq([card_1, card_2])
    end
  end


end
