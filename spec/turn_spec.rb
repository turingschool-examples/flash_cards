require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn).to be_instance_of(Turn)
        expect(turn.card).to eq(card)
    end

    xit 'returns a guess' do
        turn = Turn.new("Juneau", card)

        expect(Turn.guess).to eq("Juneau")
    end

    xit 'returns the Card' do
        turn = Turn.new("Juneau", card)

        expect(Turn.card).to eq("What is the capital of Alaska?", "Juneau", :Geography)

    end
    xit 'refers to the card object from the Card class' do
        Turn.new("Juneau", card)

        expect(turn.answer).to eq(card)
    end

    xit 'evaluates wheteher the answer is correct' do
        card = Turn.new("Juneau", card)

        expect(turn.correct?).to eq()
    end

    xit 'provides feedback' do
        card = Turn.new("Juneau", card)

        expect(turn.feedback).to eq("Correct!")
    end

end
