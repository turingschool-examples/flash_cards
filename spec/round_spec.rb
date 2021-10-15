require './lib/round'
require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Round do
  it 'exists'do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round).to be_instance_of(Round)
    expect(round.deck).to be_a(Deck)
    expect(round.turns).to eq([])
  end

  it 'gives you one card back' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round.current_card).to eq(card_1)
  end

  it 'takes a correct turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round.take_turn("Juneau").correct?)
  end

  it 'has a list of taken turns' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    turn = round.take_turn("Juneau")
    actual = round.turns
    expected = [turn]
    expect(actual).to eq(expected)
  end

  it 'tracks correct turns' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    # "Precondition"
    expect(round.number_correct).to eq(0)
    turn = round.take_turn("Juneau")

    # "Postcondition"
    expect(round.number_correct).to eq(1)
  end

  it 'advances to the next card after taking a turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    # Precondition
    expect(round.current_card).to eq(card_1)

    # Action Step
    round.take_turn("Doesn't matter")

    # Postcondition
    expect(round.current_card).to eq(card_2)
  end

  it 'gives feedback on the second turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn("Juneau")

    # Precondition
    expect(round.turns.count).to eq(1)
    expect(round.turns.last.feedback).to eq("Correct!")
    expect(round.number_correct).to eq(1)

    # Action Step
    round.take_turn("Venus")

    # Postcondition
    expect(round.turns.count).to eq(2)
    expect(round.turns.last.feedback).to eq("Incorrect.")
    expect(round.number_correct).to eq(1)
  end

  it 'filters correct answers by category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    # Precondition
    expect(round.number_correct_by_category(:Geography)).to eq(0)
    expect(round.number_correct_by_category(:STEM)).to eq(0)

    # Action Step
    round.take_turn("Juneau")
    round.take_turn("Venus")

    # Postcondition
    expect(round.number_correct_by_category(:Geography)).to eq(1)
    expect(round.number_correct_by_category(:STEM)).to eq(0)
  end

  it 'reports a percentage of correct responses' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    # Precondition
    expect(round.percent_correct).to eq(0)

    # Action Step
    round.take_turn("Juneau")
    round.take_turn("Venus")

    # binding.pry
    # Postcondition
    expect(round.percent_correct).to eq(50.0)
  end

  it 'reports a percentage of correct responses' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    # Precondition
    expect(round.percent_correct_by_category(:Geography)).to eq(0)

    # Action Step
    round.take_turn("Juneau")
    round.take_turn("Venus")

    # binding.pry
    # Postcondition
    expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
  end

  it 'counts the number of turns for a single category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    # Precondition
    expect(round.count_turns_by_category(:Geography)).to eq(0)

    # Action Step
    round.take_turn("Juneau")
    round.take_turn("Venus")

    # binding.pry
    # Postcondition
    expect(round.count_turns_by_category(:Geography)).to eq(1)
  end

end
