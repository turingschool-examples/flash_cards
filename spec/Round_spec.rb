require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

Respec.describe Round do
    it 'describes Round class' do
        round = Round.new(deck)

        expect(round.deck). to eq(Round)
        expect(round.turns).to eq([])
    end