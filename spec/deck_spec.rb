require './lib/card'
require './lib/deck'

describe Deck do
  it "first card" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card_1).to be_instance_of(Card)
  end

  it "second card" do
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    expect(card_2).to be_instance_of(Card)
  end

end
