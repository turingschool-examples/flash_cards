require '../lib/card'
require '../lib/turn'
require '../lib/deck'
require 'pry'

RSpec.describe Deck do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  let(:cards) {[card_1,card_2,card_3]}

  it "can hold cards" do
    deck = Deck.new(cards)

    expect(deck.cards.size).to eq(3)
  end

  it "exists" do
    deck = Deck.new(cards)

    expect(deck).to be_instance_of Deck
  end

  it "can show number of cards in deck" do
    deck = Deck.new(cards)

    expect(deck.count).to eq(3)
  end

  it "can show cards in deck" do
    deck = Deck.new(cards)

    expect(deck.cards).to eq(cards)
  end

  it "can show cards from a category" do
    deck = Deck.new(cards)

    stem_cards = [card_2,card_3]
    expect(deck.cards_in_category(:STEM)).to eq(stem_cards)

    geo_cards = [card_1]

    deck = Deck.new(cards)
    expect(deck.cards_in_category(:Geography)).to eq(geo_cards)
  end
end
