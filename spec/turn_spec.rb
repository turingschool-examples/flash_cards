require 'rspec'
require './lib/turn'
require './lib/card'



describe '#initialize' do

  it "it exists" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_a(Turn)
  end

  it "has a guess" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end

  it "has a card" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to be_a(Card)
  end
end

describe '#correct?' do
  it 'is true or false' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Juneau", card)
    turn2 = Turn.new("Anchorage", card)

    expect(turn1.correct?(@guess)).to eq(true)
    expect(turn2.correct?(@guess)).to eq(false)
  end
end
describe  '#feedback' do
  it "gives guess feedback" do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Juneau", card1)

    card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn2 = Turn.new("Saturn", card2)

    expect(turn1.feedback(@guess)).to eq("Correct!")
    expect(turn2.feedback(@guess)).to eq("Incorrect.")
  end
end
