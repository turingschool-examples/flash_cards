require 'RSpec'
require './lib/round'
require './lib/deck'
require './lib/card'
require './lib/turn'

describe Round do
  it 'creates a new instance' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
  expect(round).to be_an_instance_of(Round)
  end
end

describe 'current_card' do
  it 'shows first card in deck array' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards  = [card_1, card_2, card_3]
    deck   = Deck.new(cards)
    round  = Round.new(deck)
    expect(round.current_card).to eq(card_1)
  end
end


describe 'take_turn_1' do
  it 'takes a string representing a guess' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards  = [card_1, card_2, card_3]
    deck   = Deck.new(cards)
    round  = Round.new(deck)
    new_turn = round.take_turn('Juneau')
    expect(new_turn.guess).to eq("Juneau")
  end
end


describe 'take_turn_2' do
  it 'creates a new take_turn object' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards  = [card_1, card_2, card_3]
    deck   = Deck.new(cards)
    round  = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(new_turn.class).to eq(Turn)
  end
end

describe 'take_turn_3' do
  xit ' stores new turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards  = [card_1, card_2, card_3]
    deck   = Deck.new(cards)
    round  = Round.new(deck)
    new_turn = round.take_turn("Juneau")
  end
end

describe 'take_turn_4' do
  it 'moves to the next card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards  = [card_1, card_2, card_3]
    deck   = Deck.new(cards)
    round  = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(round.current_card).to eq(card_2)
  end
end

describe 'turns' do
  it 'creates an empty array' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards  = [card_1, card_2, card_3]
    deck   = Deck.new(cards)
    round  = Round.new(deck)
    expect(round.turns).to eq([])
  end
end

describe 'number_correct' do
  xit 'returns number of correct guesses' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards  = [card_1, card_2, card_3]
    deck   = Deck.new(cards)
    round  = Round.new(deck)
  end
end

describe 'number_correct_by_category' do
  xit 'returns number of correct guesses by category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards  = [card_1, card_2, card_3]
    deck   = Deck.new(cards)
    round  = Round.new(deck)
  end
end

describe 'percent_correct' do
  xit 'returns percent of correct guesses' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    card_4 = Card.new
    cards  = [card_1, card_2, card_3]
    deck   = Deck.new(cards)
    round  = Round.new(deck)

    round.take_turn("Juneau")
  end
end

describe 'percent_correct_by_category' do
  xit 'returns percent of correct guesses by category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards  = [card_1, card_2, card_3]
    deck   = Deck.new(cards)
    round  = Round.new(deck)
  end
end
