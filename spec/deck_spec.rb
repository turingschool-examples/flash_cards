require './lib/card'
require './lib/deck'

RSpec.describe Deck do

  before :each do
    @card1 = Card.new("What is the capital of Alaska?", 'Juneau', category = :Geography)
    @card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which plant?", 'Mars', category = :STEM)
    @card3 = Card.new('Describe in words the exact direction that is 697.5 clockwise from due north?', "North north west", categoy = :StEM)
    @deck = Deck.new([])
  end

  it "exists" do
    expect(@deck).to be_an(Deck)
  end

  it "has attributes" do
    expect(@deck.cards).to eq([])
  end
end
