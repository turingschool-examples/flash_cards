require './lib/round'
require './lib/deck'
require './lib/card'
require './lib/turn'


RSpec.describe Round do
    describe '#initialize' do
        it 'exists' do 
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            deck = Deck.new(card)

            expect(Round.new(deck)).to be_a Deck
        end

        it 'has a deck' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            deck = Deck.new(card)

            expect(Round.new(deck).deck).to eq deck
        end

        it 'has empty turns array by default' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            deck = Deck.new(card)
            
            expect(round.turns).to eq []
        end
    end
end