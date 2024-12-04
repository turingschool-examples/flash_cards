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

        expect(turn.guess).to eq("Canada")
    end

    it 'determine right or wrong' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Canada", card)

        expect(turn.correct?).to eq(false)
    end

    it 'gives feedback string' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Canada", card)

        expect(turn.response).to eq("WRONG-O!")
    end
end
