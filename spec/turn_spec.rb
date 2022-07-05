require './lib/card'

RSpec.describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        turn = Turn.new("Juneau", card)

        expect(turn).to be_instance_of(Turn)
    end

    it 'has guess' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        turn = Turn.new("Juneau", card)
        expect(turn.guess).to eq("Juneau")
    end

    it 'has current card' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        turn = Turn.new("Juneau", card)

        expect(turn.card).to be_instance_of(Card)
        expect(turn.card).to be card
    end

    it 'determines if the guess is correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        turn = Turn.new("Juneau", card)

        expect(turn.correct?).to be true
    end

    it 'determines if the guess is correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        turn = Turn.new("Palm Springs", card)

        expect(turn.correct?).to be false
    end

    it 'provides feedback if guess is correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        turn = Turn.new("Juneau", card)

        expect(turn.feedback).to eq("Correct!")
    end
end