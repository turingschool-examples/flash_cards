require './lib/turn'
require './lib/card'
RSpec.describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new('Juneau', card)
        expect(turn).to be_instance_of(Turn)
    end
    it 'returns correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new(true, card)
        expect(turn.correct?).to eq(false)
    end
    it 'returns false' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new(false, card)
        expect(turn.correct?).to eq(false)
    end
end