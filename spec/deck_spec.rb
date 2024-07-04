require './lib/card'
require './lib/deck'

RSpec.describe Deck do
    it 'proves Deck exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_deck = Deck.new(card_1)

        expect(card_deck).to be_a(Deck)
    end
end