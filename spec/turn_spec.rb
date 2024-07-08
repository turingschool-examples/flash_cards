require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    before (:all) do
        @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @turn = Turn.new("Juneau", @card)
    end
    it 'exists' do
        expect(@turn).to be_instance_of(Turn)
    end

    describe 'initialize' do
        it 'has a guess' do
            expect(@turn.guess).to eq("Juneau")
        end

        it 'has a card' do
            expect(@turn.card).to eq(@card)
        end
    end

    it 'checks the answer' do
        expect(@turn.correct?).to eq true

        turn = Turn.new("Cheboygan", @card)
        expect(turn.correct?).to eq false
    end

    it 'provides feedback to answer' do
        expect(@turn.feedback).to eq "Correct!"

        turn = Turn.new("Cheboygan", @card)
        expect(turn.feedback).to eq "Better luck next time"
    end

    describe 'edge cases' do
        it 'answers correctly even is capitalization is wrong' do
            expect(@turn.feedback).to eq "Correct!"
            turn = Turn.new('juneau', @card)
            expect(turn.feedback).to eq "Correct!"
        end
    end
end