require 'pry'
require './lib/turn'

RSpec.describe Turn do
    it 'is a turn' do
        turn = Turn.new("Juneau", Card)


    expect(turn).to be_instance_of(Turn)
    end

    it 'turn has a card' do
        turn.card

    expect(turn.card).to eq(card)
    end

end

binding.pry
