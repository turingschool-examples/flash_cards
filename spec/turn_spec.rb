require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    it 'exists' do
        turn = Turn.new("Juneau", @card)

        expect(turn).to be_instance_of(Turn)
    end

    it 'has an answer' do
        turn = Turn.new("Juneau", @card)

        expect(turn.guess).to eq("Juneau")
    end

    it 'takes in a card' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.card).to eq(card)
    end

    it 'returns true if guess is correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.correct?).to eq(true)
    end

    it 'returns false if guess is incorrect' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Anchorage", card)

        expect(turn.correct?).to eq(false)
    end

    it 'returns "Correct!" when guess is correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.feedback).to eq("Correct!")
    end

    it 'returns "Incorrect." if guess is incorrect' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Anchorage", card)

        expect(turn.feedback).to eq("Incorrect.")
    end
end