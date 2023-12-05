require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  let(:card_1) { Card.new("What is the capital of Alaska?", "Juneau", "Geography") }
  let(:card_2) { Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", "STEM") }
  let(:card_3) { Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", "STEM") }

  describe '#initialize' do
    it 'is an instance of Deck' do
      deck = Deck.new([])
      expect(deck).to be_a Deck
    end

    it 'has a collection of cards' do
      deck = Deck.new([])
      expect(deck.collection_card).to eq []
    end
  end

  describe '#add_card' do
    it 'add card to the deck' do
      deck = Deck.new([])

      deck.add_card(card_1)
      deck.add_card(card_2)
      deck.add_card(card_3)

      expect(deck.collection_card).to eq [card_1, card_2, card_3]
    end
  end

  describe '#count' do
    it 'count the cards in deck' do
      deck = Deck.new([card_1, card_2, card_3])

      expect(deck.collection_card.count).to eq (3)
    end
  end

  describe '#cards_in_category' do
    it 'return card on a given category' do
      deck = Deck.new([card_1, card_2, card_3])

      stem_cards = deck.cards_in_category("STEM")
      geography_cards = deck.cards_in_category("Geography")
      pop_culture_cards = deck.cards_in_category("Pop Culture")

      expect(stem_cards).to eq [card_2, card_3]
      expect(geography_cards).to eq [card_1]
      expect(pop_culture_cards).to eq []
    end
  end
end
