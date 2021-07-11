require 'rspec'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  it "exists" do

    deck = Deck.new([])

    round = Round.new(deck)

    expect(round).to be_a(Round)
  end

  it "has attributes" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)


    deck = Deck.new([card_1])

    round = Round.new(deck)

    expect(round.deck).to eq(deck)
    expect(round.turns).to eq([])
  end

  it "shows current card" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    deck = Deck.new([card_1, card_2])

    round = Round.new(deck)

    round.turns
    expect(round.current_card).to eq(card_1)


  end

    it "takes turns" do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)


    deck = Deck.new([card_1])

    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    expect(new_turn.class).to eq(Turn)
    expect(new_turn.correct?).to eq(true)
    expect(round.turns).to eq([new_turn])
  end

  it "can count correct turns" do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    deck = Deck.new([card_1])

    round = Round.new(deck)

    round.take_turn("Juneau")

    expect(round.number_correct).to eq(1)

  end

  it "can count number of correct guesses by category" do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    deck = Deck.new([card_1])

    round = Round.new(deck)

    round.take_turn("Juneau")

    expect(round.number_correct_by_category(:Geography)).to eq(1)

    expect(round.number_correct_by_category(:STEM)).to eq(0)
  end

  it "can calculate the percentage of correct answers" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    deck = Deck.new([card_1, card_2,card_3])

    round = Round.new(deck)

    round.take_turn("Juneau")
    round.take_turn("Ted")

    expect(round.percent_correct).to eq(50.0)
  end

  it "can calculate the percentage of correct answers by category" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    deck = Deck.new([card_1, card_2,card_3])

    round = Round.new(deck)

    round.take_turn("Juneau")
    round.take_turn("Ted")
    round.take_turn("Mars")

    expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
    expect(round.percent_correct_by_category(:STEM)).to eq(50.0)
  end

  it "counts cards in deck" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    deck = Deck.new([card_1, card_2])

    round = Round.new(deck)

    expect(round.card_count).to eq(2)
    round.take_turn("Juneau")
    expect(round.card_count).to eq(2)
    round.take_turn("Ted")
    expect(round.card_count).to eq(2)
  end

  it "can count turns" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    deck = Deck.new([card_1, card_2])

    round = Round.new(deck)

    expect(round.turn_count).to eq(1)
    round.take_turn("Juneau")
    expect(round.turn_count).to eq(2)
  end

  it "can display current card's question" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    deck = Deck.new([card_1, card_2])

    round = Round.new(deck)

    expect(round.current_question).to eq("What is the capital of Alaska?")

    round.take_turn("Juneau")

    expect(round.current_question).to eq("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?")
  end

end
