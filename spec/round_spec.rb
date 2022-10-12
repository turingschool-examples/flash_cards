require './lib/round'

Rspec.describe Round do
    describe '#initialize' do
        it 'exists' do 
            round = Round.new(deck)

            expect(round).to be_a Deck
        end

        it 'has a deck'
            expect(Round.new(deck).deck).to eq deck
        end

        it 'has empty turns array by default'
            expect(round.turns).to eq []
        end
    end
end