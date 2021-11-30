
require '../lib/card'
require '../lib/turn'

RSpec.describe Turn do
  it "exists" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    turn = Turn.new("Juneau",card)
    expect(turn).to be_instance_of Turn
  end

  it "displays guess" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    turn = Turn.new("Juneau",card)
    expect(turn.guess).to eq("Juneau")
  end

  it "returns true if answer is correct" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    turn = Turn.new("Juneau",card)

    expect(turn.correct?).to be true
  end
  # it "displays card" do
  #   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #   turn = Turn.new("Juneau",card)
  #   turn.card
  #   expect(turn.card).to eq(card)
  # end
end
