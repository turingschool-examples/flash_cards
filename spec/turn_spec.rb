require 'rspec'
require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  before :each do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  it 'exists' do
    expect(@turn).to be_instance_of(Turn)
  end

  it "has a guess" do
    expect(@turn.guess).to eq("Juneau")
  end

  it "has a correct guess" do
    expect(@turn.correct?).to eq(true)
  end

  it "can give feedback" do
    expect(@turn.feedback).to eq("Correct!")
  end
end
