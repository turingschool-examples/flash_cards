require "rspec"
require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn).to be_an_instance_of(Turn)
  end

  xit 'attributes' do
    expect(turn.card).to eq()
  end
end
