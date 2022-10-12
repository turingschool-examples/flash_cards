require './lib/round'

RSpec.describe Round do
    describe '#initialize' do
        it 'exists' do 
            round = Round.new(deck)

            expect(round).to be_a Deck
        end

        it 'has a deck' do
            expect(Round.new(deck).deck).to eq deck
        end

        it 'has empty turns array by default' do
            expect(round.turns).to eq []
        end
    end
end