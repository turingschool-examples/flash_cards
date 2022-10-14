require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  it 'exists' do
    card_1 = Card.new(
      'What is the capital of Alaska?',
      'Juneau',
      :Geography
    )
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?',
      'Mars',
      :STEM
    )
    card_3 = Card.new(
      'Describe in words the exact direction that is 697.5° clockwise from due north?',
      'North north west',
      :STEM
    )

    expect(card_1).to be_instance_of(Card)
    expect(card_2).to be_instance_of(Card)
    expect(card_3).to be_instance_of(Card)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(deck).to be_instance_of(Deck)
    expect(round).to be_instance_of(Round)
  end

  it 'starts a round' do
    card_1 = Card.new(
      'What is the capital of Alaska?',
      'Juneau',
      :Geography
    )
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?',
      'Mars',
      :STEM
    )
    card_3 = Card.new(
      'Describe in words the exact direction that is 697.5° clockwise from due north?',
      'North north west',
      :STEM
    )

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.deck).to be(deck)
  end

  it 'round starts with a card' do
    card_1 = Card.new(
      'What is the capital of Alaska?',
      'Juneau',
      :Geography
    )
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?',
      'Mars',
      :STEM
    )
    card_3 = Card.new(
      'Describe in words the exact direction that is 697.5° clockwise from due north?',
      'North north west',
      :STEM
    )

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  it 'has a current card' do
    card_1 = Card.new(
      'What is the capital of Alaska?',
      'Juneau',
      :Geography
    )
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?',
      'Mars',
      :STEM
    )
    card_3 = Card.new(
      'Describe in words the exact direction that is 697.5° clockwise from due north?',
      'North north west',
      :STEM
    )

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)
  end

  it 'can take a turn' do
    card_1 = Card.new(
      'What is the capital of Alaska?',
      'Juneau',
      :Geography
    )
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?',
      'Mars',
      :STEM
    )
    card_3 = Card.new(
      'Describe in words the exact direction that is 697.5° clockwise from due north?',
      'North north west',
      :STEM
    )

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)

    new_turn = round.take_turn('Juneau')

    expect(new_turn.class).to eq(Turn)
    expect(new_turn.correct?).to be true
    expect(round.turns).to eq([new_turn])
    expect(round.current_card).to eq(card_2)
  end

  it 'has a correct number of guesses' do
    card_1 = Card.new(
      'What is the capital of Alaska?',
      'Juneau',
      :Geography
    )
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?',
      'Mars',
      :STEM
    )
    card_3 = Card.new(
      'Describe in words the exact direction that is 697.5° clockwise from due north?',
      'North north west',
      :STEM
    )

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')

    expect(round.number_correct).to eq(1)
  end

  it 'can be a new card' do
    card_1 = Card.new(
      'What is the capital of Alaska?',
      'Juneau',
      :Geography
    )
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?',
      'Mars',
      :STEM
    )
    card_3 = Card.new(
      'Describe in words the exact direction that is 697.5° clockwise from due north?',
      'North north west',
      :STEM
    )

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)
    new_turn = round.take_turn('Juneau')

    expect(round.current_card).to eq(card_2)
  end

  it 'can start an new turn' do
    card_1 = Card.new(
      'What is the capital of Alaska?',
      'Juneau',
      :Geography
    )
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?',
      'Mars',
      :STEM
    )
    card_3 = Card.new(
      'Describe in words the exact direction that is 697.5° clockwise from due north?',
      'North north west',
      :STEM
    )

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)
    new_turn = round.take_turn('Juneau')

    expect(round.current_card).to eq(card_2)
    new_turn = round.take_turn('Venus')
  end

  it 'can count the number of turns' do
    card_1 = Card.new(
      'What is the capital of Alaska?',
      'Juneau',
      :Geography
    )
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?',
      'Mars',
      :STEM
    )
    card_3 = Card.new(
      'Describe in words the exact direction that is 697.5° clockwise from due north?',
      'North north west',
      :STEM
    )

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)
    new_turn = round.take_turn('Juneau')
    expect(round.turns.count).to eq(1)

    expect(round.current_card).to eq(card_2)
    new_turn = round.take_turn('Venus')
    expect(round.turns.count).to eq(2)
  end

  it 'gives feedback based on the guess' do
    card_1 = Card.new(
      'What is the capital of Alaska?',
      'Juneau',
      :Geography
    )
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?',
      'Mars',
      :STEM
    )
    card_3 = Card.new(
      'Describe in words the exact direction that is 697.5° clockwise from due north?',
      'North north west',
      :STEM
    )

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)
    new_turn = round.take_turn('Juneau')
    expect(round.turns.last.feedback).to eq('Correct!')

    expect(round.current_card).to eq(card_2)
    new_turn = round.take_turn('Venus')
    expect(round.turns.last.feedback).to eq('Incorrect')
  end

  it 'gives number of correct guesses by category' do
    card_1 = Card.new(
      'What is the capital of Alaska?',
      'Juneau',
      :Geography
    )
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?',
      'Mars',
      :STEM
    )
    card_3 = Card.new(
      'Describe in words the exact direction that is 697.5° clockwise from due north?',
      'North north west',
      :STEM
    )

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)
    new_turn = round.take_turn('Juneau')
    expect(round.turns.last.feedback).to eq('Correct!')
    expect(round.number_correct_by_category(:Geography)).to be(1)

    expect(round.current_card).to eq(card_2)
    new_turn = round.take_turn('Venus')
    expect(round.turns.last.feedback).to eq('Incorrect')
    expect(round.number_correct_by_category(:STEM)).to be(0)
  end
end


# round.number_correct_by_category(:Geography)
# #=> 1

# expect(round.number_correct_by_category(:STEM))
# #=> 0

# round.percent_correct
# #=> 50.0

# round.percent_correct_by_category(:Geography)
# #=> 100.0

# round.current_card
# #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
