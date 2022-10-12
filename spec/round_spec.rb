require './lib/card'

require './lib/turn'

require './lib/deck'

require './lib/round'

RSpec.describe Round do
    describe '#initialize' do

        it 'exists' do
        deck = Round.new("deck")

        expect(round).to be_instance_of(Round)
        end
    end
end