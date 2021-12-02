require './lib/turn'
require './lib/card'
require 'pry'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn).to be_instance_of (Turn)
  end
  it 'holds a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.card).to be_instance_of (Card)
  end
end
  #xit 'holds a card' do
  #  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#  turn = Turn.new("Juneau", card)
#end
