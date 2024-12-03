require 'rspec'
require './lib/turn'
require './lib/card'

describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn).to be_a(Turn)
    end
end