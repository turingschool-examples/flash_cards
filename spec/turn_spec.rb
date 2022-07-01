require './lib/card'
require './lib/turn'

RSpec.describe Turn do
    before :each do
      @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      @turn = Turn.new("Juneau", @card)
  end

  it 'exists' do
    expect(@turn).to be_instance_of(Turn)
  end

  it "returns a card" do
    expect(@turn.card).to be_instance_of(Card)
  end

  it "returns an answer" do
    expect(@turn.guess).to eq("Juneau")
  end

  it "returns if correct or not" do
    @turn.card
    @turn.guess
    expect(@turn.correct?).to eq(true)
  end

  it "returns a string response of correct/incorrect" do
    expect(@turn.guess).to eq("Juneau")
    expect(@turn.correct?).to eq(true)
    expect(@turn.feedback).to eq("Correct!")
  end

  it "will handle incorrect guesses" do
    @turn = Turn.new("Saturn", @card)
    expect(@turn.guess).to eq("Saturn")
    expect(@turn.correct?).to eq(false)
    expect(@turn.feedback).to eq("Incorrect.")
  end
end
