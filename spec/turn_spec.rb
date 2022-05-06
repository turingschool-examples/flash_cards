require './lib/card'
require './lib/turn'
require 'pry'

RSpec.describe Turn do
  before :each do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end
  it "exists" do
    expect(@turn).to be_a Turn
  end

  it "can give correct response" do
    expect(@turn.guess).to eq "Juneau"
    expect(@turn.correct?).to eq true
    expect(@turn.feedback).to eq "Correct!"
  end

  it "can give incorrect response" do
    card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn2 = Turn.new("Saturn", card2)

    expect(turn2.guess).to eq "Saturn"
    expect(turn2.correct?).to eq false
    expect(turn2.feedback).to eq "Incorrect."
  end
end
