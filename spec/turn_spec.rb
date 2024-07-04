require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    it 'test it exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        
        expect(turn).to be_a(Turn)
    end

    it 'is a correct guess' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.correct?).to eq(true)
    end

    # it 'returns a message when correct' do
    #     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #     turn = Turn.new("Juneau", card)

    #     expect(turn.feedback).to eq("Correct!")
    end

end