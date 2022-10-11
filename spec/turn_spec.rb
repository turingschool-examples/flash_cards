require 'rspec'
require './lib/turn'
require './lib/card'

describe turn do
    describe '#initialize' do
        it 'is an instance of turn' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new("Juneau", card)
            expect(turn).to be_a Turn
        end
    end
end