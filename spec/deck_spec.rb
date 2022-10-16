require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  let(:card_1) { Card.new('What is a blue?', 'Color', :Basics) }
  let(:card_2) { Card.new('What is water?', 'Liquid', :STEM) }
  let(:card_3) { Card.new('What is a bear?', 'Animal', :Basics) }
  let(:deck) { Deck.new([card_1, card_2, card_3]) }
  let(:round) { Round.new(deck) }

  describe '#initialize' do
    it 'is a Deck' do
      expect(deck).to be_a Deck
    end

    it 'takes an array of cards' do
      expect(deck.cards).to be_a Array
      expect(deck.cards[0]).to be_a Card
    end
  end

  describe '#count' do
    it 'returns number of cards in deck as integer' do
      expect(deck.count).to eq(3)
    end
  end

  describe '#cards_in_category' do
    it 'returns all card instances of passed in category' do
      expect(deck.cards_in_category(:Basics)).to eq([card_1, card_3])
      expect(deck.cards_in_category(:STEM)).to eq([card_2])
    end
  end
end
