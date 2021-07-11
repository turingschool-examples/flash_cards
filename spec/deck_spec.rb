require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  context 'initialize' do
    it 'exists' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)

      expect(deck).to be_instance_of(Deck)
    end

    it 'can create an array of card objects' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)

      expect(deck.cards).to eq([card_1, card_2, card_3])
      expect(deck.cards[0]).to be_instance_of(Card)
      expect(deck.cards[1]).to be_instance_of(Card)
      expect(deck.cards[2]).to be_instance_of(Card)
    end
  end
  context 'methods' do
    it 'create an array of card objects that all have the same category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)

      expect(deck.cards_in_category(:STEM)[0]).to be_a(Card)
      expect(deck.cards_in_category(:STEM)[1]).to be_a(Card)
      expect(deck.cards_in_category(:Geography)[0]).to be_a(Card)
      expect(deck.cards_in_category(:Geography)).to eq([card_1])
      expect(deck.cards_in_category(:STEM)).to eq([card_2, card_3])
    end

    it 'can count the number of cards in a deck' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)

      expect(deck.count).to eq(3)
    end

    it 'can store all the cards categories into symbols in an array' do
      filename = "./resources/cards.txt"
      cards = CardGenerator.new(filename)
      deck = Deck.new(cards.make_cards)

      expect(deck.categories).to eq([:STEM, :"Turing Staff", :PopCulture])
    end
  end
end
