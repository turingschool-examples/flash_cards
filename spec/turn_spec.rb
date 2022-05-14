require './lib/helper.rb'

RSpec.describe Turn do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)

  it "is an instance of" do
    expect(turn).to be_instance_of(Turn)
  end

  it "can make a guess" do
    expect(turn.guess).to eq("Juneau")
  end

  it "can check if a guess is correct" do
    expect(turn.correct?).to eq(true)
  end

  it "can give the user feedback" do
    expect(turn.feedback).to eq("Correct!")
  end
end
