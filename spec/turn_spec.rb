require './lib/turn'
require './lib/card'
require 'rspec'
require 'pry' 

describe Turn do
    describe '#initialize'
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Jeaneau", card)

        expect(turn).to be_instance_of(Turn)

    end
end