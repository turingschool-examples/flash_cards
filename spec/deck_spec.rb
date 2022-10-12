require './lib/card'
require './lib/deck'
require 'rspec'

describe Deck do
  describe '#initialize' do
    it 'is an instance of Deck' do
      deck = Deck.new(cards)

      expect(deck).to be_a Deck
    end

    it 'has cards' do

    end

    it 'can count how many cards' do

    end
  end

  describe '#cards_in_category' do
    it 'returns cards based on a given category' do

    end
  end
end
