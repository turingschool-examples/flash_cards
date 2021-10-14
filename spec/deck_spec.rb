require './lib/card'
require './lib/deck'

describe Deck do

  before(:each) do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    @deck = Deck.new(cards)
  end

  describe '#initialize' do
    it 'is an instance of Deck' do
      expect(@deck).to be_a(Deck)
    end
  end

  describe '#count' do
    it 'gives correct card count' do
      expect(@deck.count).to eq(3)
    end
  end

  describe '#cards_in_category' do
    it 'filters cards by category' do
      expect(@deck.cards_in_category(:STEM).length).to eq(2)
    end
    it 'returns empty array for nonexistent category' do
      expect(@deck.cards_in_category('Pop Culture').length).to eq(0)
    end
  end
end
