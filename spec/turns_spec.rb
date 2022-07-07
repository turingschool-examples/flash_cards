require './lib/turn'
require './lib/card'

RSpec.describe Turn do

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    
    it 'exists' do
        turn = Turn.new("Juneau", card)
        expect(turn).to be_instance_of(Turn)
    end

    it 'returns a card' do
        turn = Turn.new("Juneau", card)

        expect(turn.card).to eq(card)
    end

    it 'returns a guess' do
        turn = Turn.new("Juneau", card)

        expect(turn.guess).to eq("Juneau")
    end

    it 'is_guess_correct?' do
        turn = Turn.new("Juneau", card)

        expect(turn.correct?).to eq(true)
    end

    it 'gives_feedback' do
        turn = Turn.new("Juneau", card)
        
        expect(turn.feedback).to eq("Correct!")
    end
end
