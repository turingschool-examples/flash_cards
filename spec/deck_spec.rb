require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  describe '#initialize' do
    it 'exists' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]

      deck = Deck.new(cards)

      expect(deck).to be_instance_of(Deck)
    end

    it 'holds cards' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]

      deck = Deck.new(cards)

      expect(deck.cards).to eq(cards)
    end
  end

  describe '#count' do
    it 'counts the cards' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]

      deck = Deck.new(cards)

      expect(deck.count).to eq(3)
    end
  end

  describe '#cards_in_category' do
    it 'returns an array of cards of the requested category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]

      deck = Deck.new(cards)

      stem_cards = deck.cards_in_category(:STEM)

      expect(stem_cards).to eq([card_2, card_3])

      pop_cards = deck.cards_in_category("Pop Culture")

      expect(pop_cards).to eq([])
    end
  end
end
