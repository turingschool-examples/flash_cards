require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

RSpec.describe Round do
  it "exists and has attributes" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round).to be_a Round
    expect(round.deck).to be_a Deck
    expect(round.turns).to eq []
    expect(round.current_card).to eq card_1
  end

  it "can take a turn and return next card" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(new_turn.correct?).to eq true
    expect(round.turns).to eq [new_turn]
    expect(round.number_correct).to eq 1
    expect(round.current_card).to eq card_2

    round.take_turn("Venus")

    expect(round.turns.count).to eq 2
    expect(round.turns.last.feedback).to eq "Incorrect."
    expect(round.number_correct).to eq 1
  end

  it "can return correct answers by category" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.take_turn("Juneau")
    round.take_turn("Venus")

    expect(round.number_correct_by_category(:Geography)).to eq 1
    expect(round.number_correct_by_category(:STEM)).to eq 0
  end

  it "can return percent correct and by category" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.take_turn("Juneau")
    round.take_turn("Venus")

    expect(round.percent_correct).to eq 50.0
    expect(round.percent_correct_by_category(:Geography)).to eq 100.0
  end

  it "can return the next card" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.take_turn("Juneau")
    round.take_turn("Venus")

    expect(round.current_card).to eq card_3
  end
end
