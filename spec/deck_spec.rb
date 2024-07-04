require './lib/card'
require './lib/deck'

RSpec.describe Deck do
    it 'proves Deck exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_deck = Deck.new(card_1)

        expect(card_deck).to be_a(Deck)
    end

    xit 'will add cards to an array' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_deck = Deck.new(card_1)
        card_1.add_cards

        expect(card_deck.cards).to eq(3)
    end
end