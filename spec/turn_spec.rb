require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    it 'a turn exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("What am I?", card)

        expect(turn).to be_instance_of(Turn)
    end

    it 'has a guess' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Canada", card)

        expect(turn.guess).to eq("canada")
    end

    it 'determine it is wrong' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Canada", card)

        expect(turn.correct?).to eq(false)
    end

    it 'gives feedback string wrong' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Canada", card)

        expect(turn.feedback).to eq("WRONG-O!")
    end

    it 'determine it is right' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.correct?).to eq(true)
    end

    it 'gives feedback string correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.feedback).to eq("Correct")
    end
end
