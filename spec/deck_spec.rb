require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it "exists" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new(cards, deck)
    expect(deck).to be_instance_of(Deck)
  end
  it "counts the number of cards in the deck" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new(cards, deck)
    expect(deck.count).to eq([3])
  end

  it "returns an array of cards that have a matching category" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new(cards, deck)
    expect(deck.cards_in_category(:stem)).to eq([card_2, card_3])
  end
end
