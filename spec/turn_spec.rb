require './lib/turn'
require './lib/card'

describe Card do
    it 'exists' do 
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn).to be_an_instance_of(Turn)
    end

    it 'gives feedback' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        expect(turn.correct?).to be(true)
        expect(turn.feedback).to eq("Correct!")
    end

    it 'gives negative feedback' do
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Saturn", card)
        expect(turn.correct?).to be(false)
        expect(turn.feedback).to eq("Incorrect.")
    end
end