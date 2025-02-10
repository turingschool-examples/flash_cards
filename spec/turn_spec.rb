require "./lib/turn"
require "./lib/card"
require "pry"
require "rspec"

describe Turn do
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
    @turn_incorrect = Turn.new("null", @card)
  end

  it "initialize" do
    expect(@turn).to be_instance_of(Turn)
  end

  it "has a card" do
    expect(@turn.card).to eq(@card)
  end

  it "has a guess" do
    expect(@turn.guess).not_to be_nil
  end

  it "check if incorrect" do
    expect(@turn_incorrect.correct?).to be false
  end

  it "check if correct" do
    expect(@turn.correct?).to be true
  end

  it "has correct feedback" do
    expect(@turn.feedback).to eq("Correct!")
  end

  it "has incorrect feedback" do
    expect(@turn_incorrect.feedback).to eq("Incorrect.")
  end
end