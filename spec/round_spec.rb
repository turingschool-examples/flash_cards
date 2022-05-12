require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

describe Round do
  it "Round exists" do
    card1 = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)
    card2 = Card.new("What do the letters CPU stand for in computing?", "Central Processing Unit", :Technology)
    card3 = Card.new("What do the letters GPU stand for in computing?", "Graphics Processing Unit", :Technology)
    card4 = Card.new("What does NBA stand for in US Sports?", "National Basketball Association", :Sports)

    cards = [card1, card2, card3, card4]

    deck = Deck.new(cards)

    round = Round.new(deck)

    expect(round).to be_a Round
  end

  it "Has a deck" do
    card1 = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)
    card2 = Card.new("What do the letters CPU stand for in computing?", "Central Processing Unit", :Technology)
    card3 = Card.new("What do the letters GPU stand for in computing?", "Graphics Processing Unit", :Technology)
    card4 = Card.new("What does NBA stand for in US Sports?", "National Basketball Association", :Sports)

    cards = [card1, card2, card3, card4]

    deck = Deck.new(cards)

    round = Round.new(deck)

    expect(round.deck).to eq deck
  end
end
