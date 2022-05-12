require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  before :each do
    @card = Card.new("What is the capital of Alaska?", "Juneau", category = :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  it "exists" do
    expect(@turn).to be_an(Turn)
  end

  it "has attributes" do
    expect(@turn.card).to eq(@card)
    expect(@turn.guess).to eq("Juneau")
  end

  it "can check if the guess is correct" do
  expect(@turn.correct?).to eq(true)
  end

end
