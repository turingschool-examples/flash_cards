require './lib/turn'
require './lib/card'

RSpec.describe Turn do

  before do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  it "has a guess" do
    expect(@turn.guess).to eq "Juneau"
  end

  it "has a card" do
    expect(@turn.card).to eq @card
  end

  it "knows whether the guess is correct" do
    expect(@turn.correct?).to eq true
  end

  it "gives feedback if correct" do
    expect(@turn.feedback).to eq "Correct!"
  end
end
