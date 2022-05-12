require 'rspec'
require './lib/card'
require './lib/deck'

describe Deck do
  it 'Deck exists' do
    card1 = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)
    card2 = Card.new("What do the letters CPU stand for in computing?", "Central Processing Unit", :Technology)

    cards = [card1, card2]

    deck = Deck.new(cards)

    expect(deck).to be_a Deck
  end

  it "Contains cards" do
    card1 = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)
    card2 = Card.new("What do the letters CPU stand for in computing?", "Central Processing Unit", :Technology)

    cards = [card1, card2]

    deck = Deck.new(cards)

    expect(deck.cards).to eq [card1, card2]
  end

  it "Returns how many cards are in the deck" do
    card1 = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)
    card2 = Card.new("What do the letters CPU stand for in computing?", "Central Processing Unit", :Technology)

    cards = [card1, card2]

    deck = Deck.new(cards)

    expect(deck.count).to eq 2

  end
end
