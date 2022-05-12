require './lib/turn'
require './lib/card'
require 'rspec'

describe Turn do
  it "exists" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_a(Turn)
    expect(card).to be_a(Card)

  end

  it "has attributes" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq "Juneau"
    expect(turn.card).to eq card

  end

  it "it checks if the answer's correct" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq true

  end

  it "it checks if the answer's incorrect" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Andrew", card)

    expect(turn.correct?).to eq false

  end

  it "gives you correct feedback" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq "Correct!"

  end

  it "gives your incorrect feedback" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Junu", card)

    expect(turn.feedback).to eq "Incorrect."

  end


end
