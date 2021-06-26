require 'rspec'
require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it "exists" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_a(Turn)
  end

  it "has attributes" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq(card)
    expect(turn.guess).to eq("Juneau")
  end

  it "can guess the correct capital" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")

    turn.guess
    expect(turn.correct?).to eq(true)
    expect(turn.feedback).to eq("Correct!")
  end

    it "can guess the incorrect capital" do

    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

    turn = Turn.new("Saturn", card)

    expect(turn.guess).to eq("Saturn")

    turn.guess
    expect(turn.correct?).to eq(false)
    expect(turn.feedback).to eq("Incorrect")
  end
end
