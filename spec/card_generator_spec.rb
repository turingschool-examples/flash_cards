require './lib/card'
require './lib/deck'
require './lib/card_generator'

RSpec.describe CardGenerator do

  before(:each) do
  @file_name = "cards.txt"
  @cards = CardGenerator.new(@file_name)
  end

  describe 'default checks' do
    it 'cards is made up of individual cards' do
      expect(@cards.cards[0]).to be_a(Card)
      expect(@cards.cards[1]).to be_a(Card)
    end

    it 'check CardGenerator Class' do
      expect(@cards).to be_a(CardGenerator)
    end

    it 'has arrays of cards' do
      expect(@cards.new_cards).to eq([])
      deck = Deck.new(@cards.cards)

      expect(@cards.new_cards).to eq(deck.cards)
    end
  end
end
