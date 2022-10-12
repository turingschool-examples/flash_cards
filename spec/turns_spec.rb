require './lib/card'
require './lib/turns'
require 'pry'

RSpec.describe Turn do
  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq(card)
  end


end
