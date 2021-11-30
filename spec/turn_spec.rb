require './lib/turn'
require './lib/card'

Rspec.describe Card do
  it "is an instance of Card" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_instance_of(card)
  end
end
