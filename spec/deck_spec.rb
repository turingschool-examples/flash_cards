require './lib/card'
require './lib/deck'

Respec.describe Deck do
    it 'exist' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new(cards)

        expect(deck.card).to eq ([card_1, card_2, card_3])
    end

    it 'counts cards' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new(cards)

        expect(deck.count).to eq(3)
    end

    it 'has categorys' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])

        expect(deck.cards_in_category(:STEM)).to eq([card_2, card_3])
        expect(deck.cards_in_category(:Geography)).to eq([card_1])
        expect(deck.cards_in_category(:Pop_Culture)).to eq([])
        expect(deck.cards_in_category(:STEM)).to be_a(Array)
        expect(deck.cards_in_category(:Geography)).to be_a(Array)
        expect(deck.cards_in_category(:Pop_Culture)).to be_a(Array)
    end
end
