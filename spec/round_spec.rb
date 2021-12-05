#require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do

  it 'exists for card_1, card_2, card_3' do #Is this bad user empathy?
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(card_1).to be_instance_of(Card)
    expect(card_2).to be_instance_of(Card)
    expect(card_3).to be_instance_of(Card)
    expect(deck).to be_instance_of(Deck)
    expect(round).to be_instance_of(Round)
  end

  it 'has a deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck   = Deck.new([card_1, card_2, card_3])
    round  = Round.new(deck)

    expect(round.deck).to eq(deck)
  end

  it 'has a turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck   = Deck.new([card_1, card_2, card_3])
    round  = Round.new(deck)

    expect(round.turns).to eq([])
  end

  it 'has a current card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck   = Deck.new([card_1, card_2, card_3])
    round  = Round.new(deck)

    expect(round.current_card).to eq(card_1)
  end

  it 'has a new turn' do
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(new_turn).to be_instance_of(Turn)
  end

  it 'checks variables class' do
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(new_turn.class).to eq(Turn)
  end

  it 'checks if correct' do
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(new_turn.correct?).to be true
  end

  it 'returns turns taken' do
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(round.turns).to eq([new_turn])
  end

  it 'returns number correct' do
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(round.number_correct).to be 1
  end

  it 'checks for new current card' do
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(round.current_card).to eq(card_2)
  end

  it 'has a wrong turn' do
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(round.take_turn("Venus")).to be_instance_of(Turn)
  end

  it 'returns 2 rounds' do
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    round.take_turn("Venus")

    expect(round.turns.count).to eq(2)
  end

  it 'returns sad path feedback' do
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    round.take_turn("Venus")

    expect(round.turns.last.feedback).to eq("Incorrect.")
  end

  it 'returns num correct after wrong guess' do
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    round.take_turn("Venus")

    expect(round.number_correct).to eq(1)
  end

  it 'has number correct by category' do
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    round.take_turn("Venus")

    expect(round.number_correct_by_category(:Geography)).to eq(1)
    expect(round.number_correct_by_category(:STEM)).to eq(0)
  end

  it 'has number correct by category' do
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    round.take_turn("Venus")

    expect(round.percent_correct).to eq(50.0)
  end

end
