require './lib/turn'
require './lib/card'
require 'rspec'
RSpec.describe Turn do

  it 'exists' do
    card = Card.new("What is the capitol of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it "has a guess" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau",card)

    expect(turn.guess).to eq("Juneau")
  end

  it "has a correct answer" do
    card = Card.new("What is the capitol of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau",card)

    expect(turn.correct?).to eq true
  end

  it "has feedback" do
    card1 = Card.new("What is the capitol of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Juneau",card1)
    card2 = Card.new("What is the capitol of Texas?", "Austin", :Geography)
    turn2 = Turn.new("Dallas", card2)
    expect(turn1.feedback).to eq "Correct!"
    expect(turn2.feedback).to eq "Incorrect!"
  end


end
