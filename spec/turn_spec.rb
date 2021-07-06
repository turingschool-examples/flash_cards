require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    turn = Turn.new("Juneau", card)
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(turn).to be_instance_of(Turn)
    expect(card).to be_instance_of(Card)
  end
