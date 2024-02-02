require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    cards = [card]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end

  it 'has a deck' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    expect(round.deck).to eq(deck)
  end

  it 'has no turns by default' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    expect(round.turns).to be_empty
  end

  it 'knows the current card' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    expect(round.current_card).to eq(card1)
  end

  it 'creates a new Turn instance when taking a turn' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    expect(new_turn).to be_instance_of(Turn)
  end

  it 'tracks turns taken' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    expect(round.turns.length).to eq(0)

    new_turn = round.take_turn("Juneau")

    expect(round.turns.length).to eq(1)

    new_turn = round.take_turn("Mars")

    expect(round.turns.length).to eq(2)
  end

  it 'counts how many guesses are correct' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    expect(round.number_correct).to eq(0)

    new_turn = round.take_turn("Juneau")

    expect(round.number_correct).to eq(1)
  
    new_turn = round.take_turn("I dunno")

    expect(round.number_correct).to eq(1)
  end


end