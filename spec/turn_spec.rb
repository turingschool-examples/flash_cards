require 'pry'
require './lib/turn'
require './lib/card'

describe Turn do
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  it "exists" do
    expect(@turn).to be_instance_of Turn
  end

  it "#card" do
    expect(@turn.card).to eq(@card)
  end

  it "#guess" do
    expect(@turn.guess).to eq("Juneau")
  end

  it "#correct?" do
    expect(@turn.correct?).to eq(true)
  end

  it "#feedback" do
    expect(@turn.feedback).to eq("Correct!")
  end
end
