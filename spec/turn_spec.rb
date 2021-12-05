require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)
    expect(turn).to be_instance_of(Turn)
  end

  it "has a guess" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)

    expect(turn.guess).to eq ("Juneau")
  end

  it "Can return the card" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)
    expect(turn.card).to eq(card_1)
  end

  it "Can return a guess as true" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)
    expect(turn.correct?).to eq(true)
  end

  it "Can return a guess as false" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Saturn", card_1)
    expect(turn.correct?).to eq(false)
  end

  it "Gives feedback Correct!" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)
    expect(turn.feedback).to eq("Correct!")
  end

  it "Gives feedback Incorrect.!" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Saturn", card_1)
    expect(turn.feedback).to eq("Incorrect.")
  end
end
