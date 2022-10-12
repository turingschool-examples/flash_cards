require './lib/card'
require './lib/turn'


RSpec.describe Turn do

    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn).to be_a(Turn)
    end

    it 'has a card' do 
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.card).to be_a(Card)
    end

    it 'has a guess' do 
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.guess).to eq("Juneau")
    end

    it 'evaluates answer as correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.correct?).to be true
    end

    it 'evaluates incorrect answer' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Seattle", card)

        expect(turn.correct?).to be false
    end

    it 'gives feedback to correct answer' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.feedback).to eq("Correct!")
    end

    it 'gives feedback to incorrect answer' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Seattle", card)

        expect(turn.feedback).to eq("Incorrect.")
    end

end

