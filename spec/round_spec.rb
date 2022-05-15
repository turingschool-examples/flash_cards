require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

# No tests included for start, end, or final_score methods due to dependence on input/output behavior

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

  it "Checks what the previous guess, feedback, etc. was" do
    card1 = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)
    card2 = Card.new("What do the letters CPU stand for in computing?", "Central Processing Unit", :Technology)
    card3 = Card.new("What do the letters GPU stand for in computing?", "Graphics Processing Unit", :Technology)
    card4 = Card.new("What does NBA stand for in US Sports?", "National Basketball Association", :Sports)

    cards = [card1, card2, card3, card4]

    deck = Deck.new(cards)

    round = Round.new(deck)

    new_turn = round.take_turn("Oklahoma City")

    expect(round.turns.last.guess).to eq "Oklahoma City"
    expect(round.turns.last.correct?).to eq true
    expect(round.turns.last.feedback).to eq "Correct!"
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

  it "Checks the number correct by category" do
    card1 = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)
    card2 = Card.new("What do the letters CPU stand for in computing?", "Central Processing Unit", :Technology)

    cards = [card1, card2]

    deck = Deck.new(cards)

    round = Round.new(deck)

    new_turn = round.take_turn("Oklahoma City")
    new_turn = round.take_turn("Central Processing Unit")

    expect(round.number_correct_by_category(:Geography)).to eq 1
    expect(round.number_correct_by_category(:Pop_Culture)).to eq 0
  end

  it "Checks the percent correct" do
    card1 = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)
    card2 = Card.new("What do the letters CPU stand for in computing?", "Central Processing Unit", :Technology)

    cards = [card1, card2]

    deck = Deck.new(cards)

    round = Round.new(deck)

    new_turn = round.take_turn("Oklahoma City")
    new_turn = round.take_turn("Central Premium Unicorn")

    expect(round.percent_correct).to eq 50.0
  end

  it "Checks the percent correct by category" do
    card1 = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)
    card2 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
    card3 = Card.new("What color is a strawberry?", "Red", :Fruits)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    round = Round.new(deck)

    new_turn = round.take_turn("Oklahoma City")
    new_turn = round.take_turn("Grand Junction")
    new_turn = round.take_turn("Red")

    expect(round.percent_correct_by_category(:Geography)).to eq 50
    expect(round.percent_correct_by_category(:Fruits)).to eq 100
  end
end
