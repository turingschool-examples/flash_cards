require './lib/card'
require './lib/turn'
require 'pry'

RSpec.describe Turn do
  it "exists" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_a Turn
  end

  it "can give correct response" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq "Juneau"
    exepect(turn.correct?).to eq true 
  end
end
