require './lib/turn'
require './lib/card'

RSpec.describe Turn do
#If time try to figure out how to pull common methods out from all tests to simplify code

    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn).to be_instance_of(Turn)
    end

    describe 'initialize' do
         before do
            @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            @turn = Turn.new("Juneau", @card)
        end

        it 'has a guess' do
            expect(@turn.guess).to eq("Juneau")
        end

        it 'has a card' do
            expect(@turn.card).to eq(@card)
        end
    end

    it 'checks the answer' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.correct?).to eq true

        turn = Turn.new("Cheboygan", card)
        expect(turn.correct?).to eq false
    end

    # it 'checks the answer even if capitalized wrong' do
    #         #**IF TIME** Provide edge case testing such as correct answer but punctuation 
    #     #is included or capitalization is wrong
    # end

    it 'provides feedback to answer' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.feedback).to eq "Correct!"

        turn = Turn.new("Cheboygan", card)
        expect(turn.feedback).to eq "Better luck next time"
    end
end