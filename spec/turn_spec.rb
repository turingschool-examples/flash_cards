require "./lib/card"
require "./lib/turn"

RSpec.describe Turn do
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)

    @card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn2 = Turn.new("Saturn", @card2)
  end

  it "exists with readable attributes" do
    expect(@turn).to be_instance_of(Turn)
    expect(@turn.card).to eq(@card)

    expect(@turn2.card).to eq(@card2)
  end
  
  it "has a guess method" do
    expect(@turn.guess).to eq("Juneau")

    expect(@turn2.guess).to eq("Saturn")
  end
  
  it "has a correct? method" do
    expect(@turn.correct?).to eq(true)

    expect(@turn2.correct?).to eq(false)
  end
  
  it "has a feedback method" do
    expect(@turn.feedback).to eq("Correct!")
    
    expect(@turn2.feedback).to eq("Incorrect.")
  end
end