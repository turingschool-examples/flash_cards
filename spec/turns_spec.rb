require './lib/turn'
require './lib/card'

RSpec.describe Turn do

    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    
    it 'exists' do
        turn = Turn.new("Saturn", card)
        expect(turn).to be_instance_of(Turn)
    end

    it 'returngs a card' do
        turn = Turn.new("Saturn", card)

        expect(turn.card).to eq(card)
    end

    it 'returns a guess' do
        turn = Turn.new("Saturn", card)

        expect(turn.guess).to eq("Saturn")
    end

    it 'is_guess_correct?' do
        turn = Turn.new("Saturn", card)

        expect(turn.correct?).to eq(false)
    end

    it 'gives_feedback' do
        turn = Turn.new("Saturn", card)

        expect(turn.feedback).to eq("Incorrect.")
    end
end
