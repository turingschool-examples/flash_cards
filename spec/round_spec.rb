require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do

  it 'exists' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise
      from due north?", "North north west", :STEM)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end

  it 'starts with no turns' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise
      from due north?", "North north west", :STEM)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  it 'current card is first in deck' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise
      from due north?", "North north west", :STEM)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.current_card).to eq(card1)
  end

  it 'creates a Turn object' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise
      from due north?", "North north west", :STEM)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    round.take_turn('Juneau')

    expect(round.turns.first).to be_instance_of(Turn)
  end

  it 'creates a Turn object with the first card' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise
      from due north?", "North north west", :STEM)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    round.take_turn('Juneau')

    expect(round.turns.first.card).to eq(card1)
  end

  it 'returns a Turn object' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise
      from due north?", "North north west", :STEM)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.take_turn('Juneau')).to be_instance_of(Turn)
  end

  it 'counts correct guesses' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise
      from due north?", "North north west", :STEM)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    round.take_turn('Juneau')
    expect(round.number_correct).to eq(1)
    round.take_turn('Venus')
    expect(round.number_correct).to eq(1)
  end

  it 'current card moves on to next in deck after take turn' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise
      from due north?", "North north west", :STEM)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    round.take_turn('Juneau')
    expect(round.current_card).to eq(card2)
  end

  it 'counts correct guesses by category' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise
      from due north?", "North north west", :STEM)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    round.take_turn('Juneau')
    round.take_turn('Venus')
    expect(round.number_correct_by_category(:Geography)).to eq(1)
    expect(round.number_correct_by_category(:STEM)).to eq(0)
  end

  it 'calculates correctness percent' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise
      from due north?", "North north west", :STEM)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    round.take_turn('Juneau')
    round.take_turn('Venus')
    expect(round.percent_correct).to eq(50.0)
  end

  it 'calculates percent correct by category' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise
      from due north?", "North north west", :STEM)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    round.take_turn('Juneau')
    round.take_turn('Venus')
    expect(round.percent_correct_by_category(:Geography)).to eq(100)
    expect(round.number_correct_by_category(:STEM)).to eq(0)
  end


end
