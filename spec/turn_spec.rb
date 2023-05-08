require "./lib/card"
require "./lib/turn"

RSpec.describe Turn do
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  it "exists with readable attributes" do
    expect(@turn).to be_instance_of(Turn)
    expect(@turn.card).to eq(@card)
  end
  
end