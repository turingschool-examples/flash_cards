require 'pry'
require './lib/turn'
require './lib/card'

describe Turn do
  before(:each) do
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn1 = Turn.new("Juneau", @card1)
    @turn2 = Turn.new("Saturn", @card2)
  end

  it "exists" do
    expect(@turn1).to be_instance_of Turn
    expect(@turn2).to be_instance_of Turn
  end

  it "#card" do
    expect(@turn1.card).to eq(@card1)
    expect(@turn2.card).to eq(@card2)
  end

  it "#guess" do
    expect(@turn1.guess).to eq("Juneau")
    expect(@turn2.guess).to eq("Saturn")
  end

  it "#correct?" do
    expect(@turn1.correct?).to eq(true)
    expect(@turn2.correct?).to eq(false)
  end

  it "#feedback" do
    expect(@turn1.feedback).to eq("Correct!")
    expect(@turn2.feedback).to eq("Incorrect.")
  end
end
