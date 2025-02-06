require './lib/turn' #Is this correct? Do I need to reference these differently as they are interacting?
require './lib/card'

RSpec.describe Turn do
    #Do I need anything here?

    
    describe '#correct' do
    it 'returns true if the guess is correct' do
        turn = Turn.new("Juneau", card)
        expect(turn.correct).to eq(true)
    end
