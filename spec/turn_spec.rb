require './lib/turn'
require './lib/card'
# require 'rspec'

RSpec.describe Turn do
  it "exists" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn).to be_a(Turn)
  end

  xit "has readable attributes" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Juneau', card)
  end

  xit "shows if the correct guess was given" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Juneau', card)
    expect(turn.correct?).to eq(true)
  end

  xit "tells if the guess is incorrect" do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    expect(turn.correct?).to eq(false)
    expect(turn.feedback).to eq("Incorrect")
    expect(turn.guess).to eq ("Saturn")
  end
  it "can return correct or incorrect" do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    expect(turn.correct?).to be_falsey
  end
  it "can return correct or incorrect" do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Mercury", card)
    expect(turn.correct?).to be_truthy
  end
end
