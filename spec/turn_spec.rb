require './lib/turn'
require './lib/card'

describe Turn do
  it "has a card" do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)

  expect(@turn.card).to eq(@card)
end

it "has a guess" do
  @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  @turn = Turn.new("Juneau", @card)

  expect(@turn.guess).to eq("Juneau")
end

  it "correct?" do
  @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  @turn = Turn.new("Juneau", @card)

  expect(@turn.correct?).to eq(true)
  end



  end
