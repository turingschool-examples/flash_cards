require './lib/card'
require './lib/deck'

RSpec.describe Deck do
    it 'exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        deck = Deck.new

        expect(card_1).to be_instance_of(Card)
    end
end
