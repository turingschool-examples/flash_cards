require '../lib/card'
require '../lib/turn'
require '../lib/deck'
require 'pry'

RSpec.describe Deck do
  it "can hold cards" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = []
    cards << card_1 << card_2 << card_3
    deck = Deck.new(cards)

    expect(deck.cards.size).to eq(3)
  end

  it "exists" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = []
    cards << card_1 << card_2 << card_3

    deck = Deck.new(cards)
    expect(deck).to be_instance_of Deck
  end

  it "can show number of cards in deck" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = []
    cards << card_1 << card_2 << card_3

    deck = Deck.new(cards)
    expect(deck.count).to eq(3)
  end

  it "can show cards in deck" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = []
    cards << card_1 << card_2 << card_3

    deck = Deck.new(cards)
    expect(deck.cards).to eq(cards)
  end
end
