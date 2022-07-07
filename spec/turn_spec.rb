require './lib/turn'
require './lib/card'
require 'rspec'

RSpec.describe Card do 
    it 'puts down a card' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        expect(card).to be_instance_of(Card)
    end
end

RSpec.describe Turn do
    it 'initiates a turn' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        expect(turn).to be_instance_of(Turn)
    end
end