require './lib/turn'
require './lib/card'

RSpec.describe Turn do

  before do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
    @bad_card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @bad_turn = Turn.new("Saturn", @bad_card)
  end

  it "has a guess" do
    expect(@turn.guess).to eq "Juneau"
  end

  it "has a card" do
    expect(@turn.card).to eq @card
  end

  it "recognizes correct guesses" do
    expect(@turn.correct?).to eq true
  end

  it "recognizes incorrect guesses" do
    expect(@bad_turn.correct?).to eq false
  end

  it "gives feedback if correct" do
    expect(@turn.feedback).to eq "Correct!"
  end

  it "gives feedback if incorrect" do
    expect(@bad_turn.feedback).to eq "Incorrect."
  end
end
