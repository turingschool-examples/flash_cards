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

  it "Returns how many cards of a given category are in the deck" do
    card1 = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)
    card2 = Card.new("What do the letters CPU stand for in computing?", "Central Processing Unit", :Technology)
    card3 = Card.new("What do the letters GPU stand for in computing?", "Graphics Processing Unit", :Technology)
    card4 = Card.new("What does NBA stand for in US Sports?", "National Basketball Association", :Sports)

    cards = [card1, card2, card3, card4]

    deck = Deck.new(cards)

    expect(deck.cards_in_category(:Technology)).to eq 2
    expect(deck.cards_in_category(:Sports)).to eq 1
    expect(deck.cards_in_category(:Video_Games)).to eq 0
  end
end
