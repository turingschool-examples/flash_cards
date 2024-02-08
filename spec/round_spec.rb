require "pry"
require "rspec"
require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"


RSpec.describe Round do
  it "exists and has attributes" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
    # expect(round.deck).to be_instance_of(Deck)
    expect(round.deck).to eq(deck)
    # expect(round.current_card).to be_instance_of(Card)
  end

  it "can track turns" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  it "#current_card" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)
  end

  it "#take_turn(guess)" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    expect(new_turn.class).to eq(Turn)
    expect(new_turn.correct?).to be(true)
    expect(round.turns).to eq([new_turn])
  end

  it "can track the number of correct rounds" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    # card_4 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    # turn = Turn.new("Saturn", card_4)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    expect(round.number_correct).to eq(1)
    expect(round.current_card).to eq(card_2)

    new_turn = round.take_turn("Venus")

    expect(round.turns.count).to eq(2)
    expect(round.turns.last.feedback).to eq("Incorrect.")
    expect(round.number_correct).to eq(1)
  end


  it "finds the number correct by category" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn("Juneau")
    round.take_turn("Venus")

    expect(round.number_correct_by_category(:Geography)).to eq(1)
    expect(round.number_correct_by_category(:STEM)).to eq(0)
    expect(round.percent_correct).to eq(50.0)
    expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
    expect(round.current_card).to eq(card_3)

    round.take_turn("Blah")

    expect(round.percent_correct).to eq(33.33)
    expect(round.number_correct_by_category(:STEM)).to eq(0)
    expect(round.percent_correct_by_category(:STEM)).to eq(0.0)
  end

  it "ensures we got the math right on percent_correct_by_category" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :Geography)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :Geography)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn("Juneau")
    expect(round.number_correct_by_category(:Geography)).to eq(1)

    round.take_turn("Venus")
    expect(round.number_correct_by_category(:Geography)).to eq(1)

    expect(round.percent_correct).to eq(50.0)
    expect(round.percent_correct_by_category(:Geography)).to eq(50.0)
    expect(round.current_card).to eq(card_3)

    round.take_turn("Blah")

    expect(round.percent_correct).to eq(33.33)
    expect(round.number_correct_by_category(:Geography)).to eq(1)
    expect(round.percent_correct_by_category(:Geography)).to eq(33.33)
  end

  it "ensures we got the math right on number_correct_by_category" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :Geography)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :Geography)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn("Juneau")
    expect(round.number_correct_by_category(:Geography)).to eq(1)

    round.take_turn("Mars")
    expect(round.number_correct_by_category(:Geography)).to eq(2)

    expect(round.percent_correct).to eq(100.0)
    expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
    expect(round.current_card).to eq(card_3)

    round.take_turn("Blah")

    expect(round.percent_correct).to eq(66.67)
    expect(round.number_correct_by_category(:Geography)).to eq(2)
    expect(round.percent_correct_by_category(:Geography)).to eq(66.67)
  end
end
