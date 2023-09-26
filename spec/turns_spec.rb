require './lib/turns'
require './lib/card'

RSpec.describe Card do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  
  it 'exists' do
    turn = Turn.new("Juneau", card)
    expect(turn).to be_instance_of(Turn)
  end

  it "is a card" do
    turn = Turn.new("Juneau", card)
    expect(turn.card).to eq(card)
  end

  it 'has a guess' do
    turn = Turn.new("Juneau", card)
    expect(turn.guess).to eq("Juneau")
  end

  it "is correct" do
    turn = Turn.new("Juneau", card)
    expect(turn.correct?).to eq(true)
  end

  it "has feedback" do
    turn = Turn.new("Juneau", card)
    expect(turn.feedback).to eq("Correct!")
  end
end


