require './lib/card'
require './lib/turns'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    turns = Turns.new("Juneau", @card)

    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end

  it 'returns a deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    turns = Turns.new("Juneau", @card)

    round = Round.new(deck)

    expect(round.deck).to eq(deck)
  end

  it 'has turns' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    turns = Turns.new("Juneau", @card)

    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  it 'has a current card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    turns = Turns.new("Juneau", @card)

    round = Round.new(deck)
    expect(round.current_card).to eq(cards[1])
  end

  it 'takes a new turn'do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    turns = Turns.new("Juneau", @card)
    # new_turn_1 = Turns.new("Juneau") #add 1 to new_turn #removed cards[0] 2nd arg.
    round = Round.new(deck)
    new_turn_1 = round.take_turn("Juneau")
    new_turn_2 = round.take_turn("Mars")
    expect(new_turn_1 = round.take_turn("Juneau")).to eq(new_turn_1)
    expect(new_turn_2 = round.take_turn("Mars")).to eq(new_turn_2)

    end
  it 'has a correct answer' do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    turns = Turns.new("Juneau", @card)
    round = Round.new(deck)

    new_turn_1 = round.take_turn("Juneau")
    new_turn_2 = round.take_turn("Mars")

    round = Round.new(deck)

    expect(new_turn_1.correct?).to be(true)

  end

  it 'has a number of answers correct'do

  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

  cards = [card_1, card_2, card_3]
  deck = Deck.new(cards)
  turns = Turns.new("Juneau", @card)
  round = Round.new(deck)

  new_turn_1 = round.take_turn("Juneau")
  new_turn_2 = round.take_turn("Mars")

  round = Round.new(deck)

  expect(round.number_correct).to eq(1)

  end

  it 'has a number of answers correct by category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    turns = Turns.new("Juneau", @card)
    round = Round.new(deck)

    new_turn_1 = round.take_turn("Juneau")
    new_turn_2 = round.take_turn("Mars")

    round = Round.new(deck)

  expect(round.number_correct_by_category(:Geography)).to eq(1)
  end

 it 'has a percent of correct answers' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    turns = Turns.new("Juneau", @card)
    round = Round.new(deck)

    new_turn_1 = round.take_turn("Juneau")
    new_turn_2 = round.take_turn("Mars")

    round = Round.new(deck)

    expect(round.percent_correct(1.0,2.0)).to eq(50.0)
  end

it 'has a percent of correct answers by category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    turns = Turns.new("Juneau", @card)
    round = Round.new(deck)

    new_turn_1 = round.take_turn("Juneau")
    new_turn_2 = round.take_turn("Mars")

    round = Round.new(deck)

    expect(round.percent_correct_by_category(:Geography)).to eq(100)
  end
end
