require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it "returns a card" do
    expect(turn.card).to be_instance_of(Card)
  end

  it "returns an answer" do
    expect(turn.guess).to eq("Juneau")
  end

  it "returns if correct or not" do
    expect(turn.correct?).to eq(true)
  end

  it "returns a string response of correct/incorrect" do
    expect(turn.feedback).to eq("Correct!")
  end

  it "will handle incorrect guesses" do
    expect(turn.guess).to eq("Saturn")
    expect(turn.correct?).to eq(false)
    expect(turn.feedback).to eq("Incorrect.")
  end
end
