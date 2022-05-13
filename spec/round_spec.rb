require 'rspec'
require 'pry'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'


RSpec.describe Round do

  xit 'exists' do

    round = Round.new()

    expect(round).to be_instance_of(Round)

  end

  it 'takes a deck as an argument' do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    expect(round.deck).to eq(deck)

  end

  it 'returns empty array on .turns before turns called' do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    expect(round.turns).to eq([])

  end

  it 'returns first card in deck' do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)

  end

  it 'take_turn takes a guess as an argument' do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    expected_turn = Turn.new("Juneau",round.current_card)

    expect(new_turn.guess).to eq("Juneau")

  end

  it 'take_turn is a Turn' do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    expect(new_turn).to be_instance_of(Turn)

  end

  it 'correct? returns true if guess is correct' do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    new_turn_1 = round.take_turn("Juneau")

    expect(new_turn_1.correct?).to be true

  end

  it 'correct? returns false if guess is correct' do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    new_turn_1 = round.take_turn("Hambone Jones")

    expect(new_turn_1.correct?).to be false

  end

  it '.turns returns array of turns taken' do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    new_turn_1 = round.take_turn("Juneau")

    expect(round.turns).to eq([new_turn_1])

  end

  it 'keeps track of number of correct guesses' do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    new_turn_1 = round.take_turn("Juneau")

    expect(round.number_correct).to eq(1)

    new_turn_2 = round.take_turn("Mars")

    expect(round.number_correct).to eq(2)

  end

  it 'produces a new card each turn' do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    new_turn_1 = round.take_turn("Juneau")

    expect(round.current_card).to eq(card_1)

    new_turn_2 = round.take_turn("Mars")

    expect(round.current_card).to eq(card_2)

  end

  it 'returns number of turns taken' do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    new_turn_1 = round.take_turn("Juneau")

    new_turn_2 = round.take_turn("Mars")

    expect(round.turns.count).to eq(2)

  end

  it 'provides feedback on last turn taken' do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    new_turn_1 = round.take_turn("Juneau")

    new_turn_2 = round.take_turn("Venus")

    expect(round.turns.last.feedback).to eq("Incorrect.")

  end



end
