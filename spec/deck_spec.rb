require './lib/turn'
require './lib/card'
require './lib/deck'

def create_test_deck
  card_1 = Card.new("What is 1 + 1?", "2", :Math)
  card_2 = Card.new("What is 50 + 20?", "70", :Math)
  card_3 = Card.new("What is 9 - 9?", "0", :Math)
  card_4 = Card.new("What is earth's gravity?", "9.8", :Science)
  card_5 = Card.new("Who came up with the Theory of Special Relativity?", "Albert Einstein", :Science)
  card_6 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  cards = [card_1, card_2, card_3, card_4, card_5, card_6]
  return Deck.new(cards)
end


RSpec.describe Deck do

  it 'exists' do
    deck = create_test_deck
    expect(deck).to be_instance_of(Deck)
  end

  describe '#cards_in_category' do
    it 'returns an array' do
      deck = create_test_deck
      expect(deck.cards_in_category(:Math)).to be_an_instance_of(Array)
    end
    it 'returns an array that contaions cards of the same category' do
      deck = create_test_deck
      expect(deck.cards_in_category(:Science).count).to eq(2)
    end
  end




end
