require './lib/turn'

RSpec.describe Turn do
    it 'is a turn' do
        turn = Turn.new("Juneau", Card)


    expect(turn).to be_instance_of(Turn)
    end
end
