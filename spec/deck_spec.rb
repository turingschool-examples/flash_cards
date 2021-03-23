require './lib/deck'
require './lib/card'

RSpec.describe Deck do

  before do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  it "has cards" do
    expect(@deck.cards).to eq [@card_1, @card_2, @card_3]
  end

  it "has the right number of cards" do
    expect(@deck.count).to eq 3
  end

  it "can count cards in a given category" do
    expect(@deck.cards_in_category(:STEM)).to eq 2
    expect(@deck.cards_in_category(:Geography)).to eq 1
    expect(@deck.cards_in_category("Pop Culture")).to eq 0
  end
end
