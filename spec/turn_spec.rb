require './lib/turn.rb'

RSpec.describe Turn do
    it 'exists' do
        turn = turn.new("Juneau", card)

        expect(turn).to_be_an_instance_of(Turn)
    end
end