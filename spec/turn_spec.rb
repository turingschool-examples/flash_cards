require './lib/turn' #getting an error here
require './lib/card'

RSpec.describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn).to be_instance_of(Turn)
    end

    describe '#correct' do
        it 'returns true if the guess is correct' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new("Juneau", card)
            expect(turn.correct?).to eq(true)
        end
        it 'returns false if the guess is incorrect' do
            card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
            turn = Turn.new("Saturn", card)
            expect(turn.correct?).to eq(false)
        end
    end

    describe 'feedback' do
        it 'returns feedback as incorrect if incorrect' do
            card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
            turn = Turn.new("Saturn", card)
            expect(turn.feedback).to eq("Incorrect")
        end
        #add correct test as well
    end
end