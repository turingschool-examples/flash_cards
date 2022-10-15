require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  it 'exists' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end

  # it can call the deck
  it 'has a deck' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.deck).to eq(deck)
  end

  # it can store and call turns
  it 'has turns' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  # it can store the current card
  it 'has a current card' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)
  end

  # it can store if correct
  it 'can return if correct' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')

    expect(new_turn.correct?).to eq(true)
  end

  it 'can count all turns taken' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')

    expect(round.turns.length).to eq(1)
  end

  it 'can return number of correct guesses' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')

    expect(round.number_correct).to eq(1)

    new_turn = round.take_turn('Venus')

    expect(round.number_correct).to eq(1)
  end

  # it can change cards
  it 'it can change current_card to next array item in array' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')

    expect(round.current_card).to eq(card_2)
    round.take_turn('Venus')
    expect(round.current_card).to eq(card_3)
  end

  it 'can count more turns' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')
    new_turn = round.take_turn('Venus')

    expect(round.turns.count).to eq(2)
  end

  it 'return feedback on last turn' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')
    new_turn = round.take_turn('Venus')

    expect(round.turns.last.feedback).to eq('Incorrect.')
  end

  it 'returns number correct by category' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')
    new_turn = round.take_turn('Venus')

    expect(round.number_correct_by_category(:Geography)).to eq(1)
    expect(round.number_correct_by_category(:STEM)).to eq(0)
  end

  it 'returns the percent of correct answers' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')
    new_turn = round.take_turn('Venus')

    expect(round.percent_correct).to eq(50.0)
  end

  it 'returns the percent of correct answers by category' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')
    new_turn = round.take_turn('Venus')

    expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
  end
end
