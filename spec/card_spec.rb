require './lib/card'

RSpec.describe Card do
  before :each do
    @card = Card.new("What is the capital of Alaska?", "Juneau", category = :Geography)
  end

    it "exists" do
      expect(@card).to be_an(Card)
    end

end
