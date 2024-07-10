require './lib/turn'
require './lib/card'

describe Turn do
    it 'exists' do
        turn = Turn.new("Juneau", card) 

        expect(turn).to be_a Turn
    end
end

it 'is a turn' do
    turn = Turn.new("Juneau", card)

    expect(card).to be_a Card
end

describe Card do
    it 'has a card' do
        turn = Turn.new("Juneau", card)
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        expect(turn.card).to be_instance_of Card
    end
end

describe 'guess' do
    it 'has a guess' do
        @guess = guess
        expect(turn.guess).to eq("Juneau")
    end
end

describe 'answer' do
    it 'has an answer' do
        expect(turn.correct?).to equal(true)
    end
end    

describe 'feedback' do
    it 'has feedback' do
        expect(turn.feedback).to eq("Correct!")
    end
end    