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

  it "Is created with no turns" do
    card1 = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)

    cards = [card1]

    deck = Deck.new(cards)

    round = Round.new(deck)

    expect(round.turns).to eq []
  end

  it "Returns the current card" do
    card1 = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)
    card2 = Card.new("What do the letters CPU stand for in computing?", "Central Processing Unit", :Technology)
    card3 = Card.new("What do the letters GPU stand for in computing?", "Graphics Processing Unit", :Technology)
    card4 = Card.new("What does NBA stand for in US Sports?", "National Basketball Association", :Sports)

    cards = [card1, card2, card3, card4]

    deck = Deck.new(cards)

    round = Round.new(deck)

    expect(round.current_card).to eq card1
  end

  it "New turns are a turn" do
    card1 = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)
    card2 = Card.new("What do the letters CPU stand for in computing?", "Central Processing Unit", :Technology)
    card3 = Card.new("What do the letters GPU stand for in computing?", "Graphics Processing Unit", :Technology)
    card4 = Card.new("What does NBA stand for in US Sports?", "National Basketball Association", :Sports)

    cards = [card1, card2, card3, card4]

    deck = Deck.new(cards)

    round = Round.new(deck)

    new_turn = round.take_turn("Oklahoma City")

    expect(new_turn).to be_a Turn
  end

  it "Outputs the number a user has gotten correct" do
    card1 = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)

    cards = [card1]

    deck = Deck.new(cards)

    round = Round.new(deck)

    new_turn = round.take_turn("Oklahoma City")

    expect(round.number_correct).to eq 1
  end

  it "Adds turns, checks if guesses are correct, and returns number correct" do
    card1 = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)
    card2 = Card.new("What do the letters CPU stand for in computing?", "Central Processing Unit", :Technology)
    card3 = Card.new("What do the letters GPU stand for in computing?", "Graphics Processing Unit", :Technology)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    round = Round.new(deck)

    new_turn = round.take_turn("Oklahoma City")
    new_turn = round.take_turn("Central Processing Unit")
    new_turn = round.take_turn("Graphical Processor Universe")

    expect(round.number_correct).to eq 2
  end
end
