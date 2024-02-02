require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn).to be_instance_of(Turn)
    end

    it 'determines guess is correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.correct?).to be true 
    end
    
    it 'determines guess is incorrect' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Sacramento", card)

        expect(turn.correct?).to be false
    end
    
    xit 'has a category' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    
        expect(turn.category).to eq(:Geography)
    end
end