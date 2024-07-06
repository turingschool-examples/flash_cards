require './lib/card'
require './lib/deck'

RSpec.describe Deck do
    it 'exists' do
        deck = Deck.new(card_1, card_2, card_3)

        expect(deck).to be_a(Deck)
    end

    it 'has a first card'
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(deck)
    end


end