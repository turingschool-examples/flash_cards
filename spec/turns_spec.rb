require './lib/card'
require './lib/turns'
require 'pry'

RSpec.describe Turns do
  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turns.new("Juneau", card)

    expect(turn.card).to eq(card)
  end


end
