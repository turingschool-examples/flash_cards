require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'shows current card' do
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq("What is the capital of Alaska?", "Juneau", :Geography)
  end

  end
