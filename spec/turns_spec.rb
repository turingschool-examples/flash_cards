require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    it 'exists' do
        turn = Turn.new("Juneau", Card)
        expect(turn).to be_instance_of(Turn)
    end

    it 'returns a card' do
        turn = Turn.new("Juneau", Card)

        expect(turn.card).to eq(Card)
    end

    xit 'returns a guess' do
        turn = Turn.new(guess)

        expect(turn.guess).to eq("Juneau")
    end

    xit 'is_guess_correct?' do
        turn = Turn.new(correct?)
        expect(turn.correct?).to eq(true)
    end

    xit 'gives_feedback' do
        turn = Turn.new(feedback)
        expect(turn.feedback).to eq("Correct!")
    end
end
