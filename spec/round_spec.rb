require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

RSpec.describe Round do
  it 'can create a Round' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end

  it 'can store a Deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.deck).to be_instance_of(Deck)
  end

  it 'has no turn information stored initially' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  it 'returns the current card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.current_card).to equal(card_1)
  end

  it 'stores a Turn with the guess' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    # not necessary, but tells you what card is up
    round.current_card

    # stores a new_turn with the guess as argument
    new_turn = round.take_turn("Juneau")

    expect(new_turn).to be_instance_of(Turn)
    expect(new_turn.class).to equal(Turn)
  end

  it 'verifies if you have the correct answer' do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)

  # not necessary, but tells you what card is up
  round.current_card

  # stores a new_turn with the guess as argument
  new_turn = round.take_turn("Juneau")

  expect(new_turn.correct?).to equal(true)
  expect(round.turns[0]).to eq(new_turn)
  end

  it 'tells you the number of correct guesses' do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)

  # not necessary, but tells you what card is up
  round.current_card

  # stores a new_turn with the guess as argument
  new_turn = round.take_turn("Juneau")

  expect(round.number_correct).to equal(1)
  end

  it 'rotates the deck' do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)

  # not necessary, but tells you what card is up
  round.current_card

  # stores a new_turn with the guess as argument
  new_turn = round.take_turn("Juneau")

  expect(round.current_card).to equal(card_2)
  end

  it 'stores a second round' do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)

  # stores a new_turn with the guess as argument
  turn1 = round.take_turn("Juneau")
  turn2 = round.take_turn("Venus")

  expect(round.turns.count).to equal(2)
  expect(round.turns.last.feedback).to eq("Incorrect.")
  expect(round.number_correct).to equal(1)
  end

  it 'tells you the number correct by category' do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)

  # stores a new_turn with the guess as argument
  turn1 = round.take_turn("Juneau")
  turn2 = round.take_turn("Venus")

  expect(round.number_correct_by_category(:Geography)).to equal(1)
  expect(round.number_correct_by_category(:STEM)).to equal(0)
  expect(round.percent_correct).to equal(50.0)
  expect(round.percent_correct_by_category(:Geography)).to equal(100.0)
  expect(round.current_card).to equal(card_3)
  end
end
