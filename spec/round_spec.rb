require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Deck do
  it 'exists' do
    round = Round.new([])
    expect(round).to be_instance_of(Round)
  end

  it 'uses a deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round.deck).to eq(deck)
  end

  it 'has a current_card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round.current_card).to eq(card_1)
  end

  it 'takes a turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(new_turn.class).to eq(Turn)
    expect(new_turn.correct?).to eq(true)
  end

  it 'saves the turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round.turns).to eq([])
    new_turn = round.take_turn("Juneau")
    expect(round.turns).to eq([new_turn])
    next_turn = round.take_turn("Mars")
    expect(round.turns).to eq([new_turn, next_turn])
  end

  it 'gives the number of correct answers' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(round.number_correct).to eq(1)
    next_turn = round.take_turn("Mars")
    expect(round.number_correct).to eq(2)
  end

it 'advances to the next card after each turn' do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [card_1, card_2, card_3]
  deck = Deck.new(cards)
  round = Round.new(deck)
  expect(round.current_card).to eq(card_1)
  new_turn = round.take_turn("Juneau")
  expect(round.current_card).to eq(card_2)
  next_turn = round.take_turn("Mars")
  expect(round.current_card).to eq(card_3)
end


end
