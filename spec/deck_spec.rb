require './lib/card'
require './lib/deck'

RSpec.describe Deck do
    it 'proves Deck exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        cards = [card_1]
        deck = Deck.new(cards)
        

        expect(deck).to be_a(Deck)
    end

    it 'shows number of cards in array' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        # add expectations for the number of cards in card_deck
        expect(deck.count).to eq (3)
    end

    it 'returns cards for specific category' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new(cards)
        expect(deck.cards_in_category(:STEM)).to eq(card_2, card_3)
    end
end