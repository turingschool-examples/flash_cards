require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  it "is an instance of turn" do
    expect(@turn).to be_a(Turn)
  end

  it "has a card" do
    expect(@turn.card).to eq(@card)
  end

  it "can make a guess" do
    expect(@turn.guess).to eq("Juneau")
  end

  it "detect a correct guess" do
    expect(@turn.correct?).to eq(true)
  end

  it "can tell you if your answer is right" do
    expect(@turn.feedback).to eq("Correct!")
  end

  it "can tell you if your answer is wrong" do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    expect(turn.correct?).to eq(false)
    expect(turn.feedback).to eq("Incorrect.")
  end


end
