require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

describe Round do
  it "exists" do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)


  end

  it "has decks" do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.deck).to eq(deck)

  end

  it "has rounds" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  it "has current card" do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)

  expect(round.current_card).to eq(card_1)
end

  it "takes turns" do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(new_turn.card).to eq(card_1)
    expect(new_turn.class).to eq(Turn)
    expect(new_turn.correct?).to eq true
    expect(round.turns).to eq([new_turn])

  end

  it "number correct" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(round.number_correct).to eq 1
    expect(round.current_card).to eq(card_2)
    expect(round.take_turn("Venus").card).to eq(card_2)
    expect(round.turns.count).to eq 2
    expect(round.turns.last.feedback).to eq("Incorrect.")
    expect(round.number_correct).to eq 1



  end

  it "number correct per category" do


    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(round.number_correct_by_category(:Geography)).to eq 1
    expect(round.number_correct_by_category(:STEM)).to eq 0

  end

  it "has round perfent" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(round.percent_correct).to eq 100.0
    round.take_turn("df")

    expect(round.percent_correct).to eq 50.0



  end

  it "takes percent by category" do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(round.percent_correct_by_category(:Geography)).to be 100.0
    round.take_turn("Mars")
    expect(round.percent_correct_by_category(:STEM)).to be 100.0

    expect(round.current_card).to eq(card_3)
    round.take_turn("Mardfdes")
    expect(round.percent_correct_by_category(:STEM)).to be 50.0



  end




end
