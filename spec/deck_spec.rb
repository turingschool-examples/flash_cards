require "./lib/card"
require "./lib/deck"
require "./lib/turn"

RSpec.describe Deck do 
    it 'exists and has cards' do
        
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)

        expect(deck).to be_instance_of(Deck)
        expect(deck.cards).to eq(cards)
        expect(deck.count).to eq(3)
    end

    it 'has a category' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)

        expect(deck.cards[2].category).to eq(:STEM)
    end
end
