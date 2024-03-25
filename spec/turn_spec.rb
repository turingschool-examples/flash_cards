require "./lib/turn"
require "./lib/card"

RSpec.describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn).to be_instance_of(Turn)
    end

    it 'has a guess' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.guess).to eq("Juneau")
    end

    it 'has a card' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.card).to be(card)
    end

    it 'checks if guess is correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.correct?).to be true
    end

    it 'checks if guess is incorrect' do
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Saturn", card)
        turn.guess

        expect(turn.correct?).to be false
    end

    it 'gives feedback' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Juneau", card)
        turn2 = Turn.new("Saturn", card)

        expect(turn.feedback).to eq("Correct!")
        expect(turn2.feedback).to eq("Incorrect.")
    end

end