require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


RSpec.describe Round do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end

  it 'starts with no turns taken' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  it 'has a current card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)
  end

  it 'takes turns' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    expect(new_turn).to be_instance_of(Turn)
  end

  it 'counts correct guesses' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    expect(round.number_correct).to eq(1)
  end

  it 'moves on to the next card after a turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    expect(round.current_card).to eq(card_2)
  end

  it 'recognizes an incorrect answer' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Venus")

    expect(round.number_correct).to eq(1)
  end

  it 'keeps track of turns' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Venus")

    expect(round.turns.count).to eq(2)
  end

  it 'provides feedback on the most recent turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Venus")

    expect(round.turns.last.feedback).to eq("Incorrect.")
  end

  it 'counts correct answers by category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Venus")

    expect(round.number_correct_by_category(:STEM)).to eq(0)
    expect(round.number_correct_by_category(:Geography)).to eq(1)
  end

  it 'returns percentage of correct answers' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Venus")

    expect(round.percent_correct).to eq(50.0)
    # expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
  end
end
