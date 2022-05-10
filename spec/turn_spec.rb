require 'rspec'
require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'card exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card).to be_instance_of(Card)
  end

  it 'turn exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn).to be_instance_of(Turn)
  end

  it 'card can be called' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.card
    expect(turn.card).to eq(card)
  end
end
