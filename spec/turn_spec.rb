require 'rspec'
require './lib/turn'
require './lib/card'

describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn).to be_a(Turn)
    end

    it 'has a card' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.card).to eq(card)
    end

    it 'has a guess' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.guess).to eq("Juneau")
    end

    it 'can identify a correct answer' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.correct?).to eq(true)
    end

    it 'can provide feedback for correct answer' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.feedback).to eq("Correct!")
    end

    it 'can identify an incorrect answer' do
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Saturn", card)

        expect(turn.correct?).to eq(false)
    end

    it 'can provide feedback for incorrect answer' do
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Saturn", card)

        expect(turn.feedback).to eq("Incorrect.")
    end

    it 'is not case sensitive' do
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("mercury", card)

        expect(turn.correct?).to eq(true)
    end
end