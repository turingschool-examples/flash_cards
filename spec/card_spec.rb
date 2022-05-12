require './lib/card'

RSpec.describe Card do
  before :each do
    @card = Card.new("What is the capital of Alaska?", "Juneau", category = :Geography)
  end

    it "exists" do
      expect(@card).to be_an(Card)
    end

    it "has attributes" do
    expect(@card.question).to eq("What is the capital of Alaska?")
    expect(@card.answer).to eq("Juneau")
    expect(@card.category).to eq(:Geography)
  end  
end
