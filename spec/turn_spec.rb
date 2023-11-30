require './lib/turn.rb'
require './lib/card.rb'

RSpec.describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn).to be_an_instance_of(Turn)
    end

    it 'reads cards' do
        card0 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn0 = Turn.new("Juneau", card0)

        expect(turn0.card).to eq (card0)
    end

    it 'evaluates correct? when true' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        turn.correct?

        expect(turn.correct?).to eq (true)
    end
end