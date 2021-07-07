require './lib/card'
require './lib/turn'


RSpec.describe Turn do
  it 'exists' do
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a card' do
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq(card)
  end


  
end
