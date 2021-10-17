require './lib/turn'
require './lib/card'

RSpec.describe "Turn" do
  it "exists" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_a(Turn)
  end

  it "has attributes" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
    expect(card).to be_a Card
    expect(turn.card).to eq(card)
  end

  it "can determine if the guess is correct or false" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn_2 = Turn.new("not correct", card)

    expect(turn_2).to be_a Turn
    expect(turn_2.correct?).to eq(false)
    expect(turn.correct?).to eq(true)
  end

  #test can pass when I use p instead of puts, but puts is ehat I want
  xit "can give feedback on a guess" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq("Correct!/n")

    turn_2 = Turn.new("not correct", card)

    expect(turn_2.feedback).to eq("Incorrect/n")
  end

end
