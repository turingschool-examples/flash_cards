require "./lib/turn"
require "./lib/card"

RSpec.describe Turn do
  it "has a card" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card) 

expect(turn.card).to eq(card)
  end

  it "has a guess" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card) 

    expect(turn.guess).to eq("Juneau") 
  end

  it "guess is correct?" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card) 

    expect(turn.correct?).to eq(true)
  end

  it "guess is incorrect?" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card) 

    expect(turn.correct?).to eq(false)
  end


  it "gives feedback" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card) 

    expect(turn.feedback).to eq("Correct!")
  end

  it "gives feedback 2nd" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card) 

    expect(turn.feedback).to eq("Incorrect.")
  end
















end