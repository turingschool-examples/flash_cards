require_relative 'spec_helper'

RSpec.describe(Round) do
  it 'exists' do
    expect(Round).to be_truthy
  end

  it 'can be initialized' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end

  it 'has a deck' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.deck).to eq(deck)
  end

  it 'has turns' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  it 'has a current_card' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)
  end

  it 'has a current_card_index function' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.current_card_index).to eq(1)
  end

  it 'can take a turn' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    turn_1 = round.take_turn('Juneau')

    expect(turn_1.class).to eq(Turn)
    expect(turn_1.correct?).to eq(true)

    expect(round.turns).to eq([turn_1])
    expect(round.number_correct).to eq(1)
    expect(round.current_card).to eq(card_2)

    round.take_turn('Venus')

    expect(round.turns.count).to eq(2)
    expect(round.turns.last.feedback).to eq('Incorrect.')
    expect(round.number_correct).to eq(1)
  end

  it 'can count number correct by category' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    turn_1 = round.take_turn('Juneau')
    turn_2 = round.take_turn('Venus')

    expect(round.number_correct_by_category(:STEM)).to eq(0)
    expect(round.number_correct_by_category(:Geography)).to eq(1)
  end

  it 'can calculate percent correct' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    turn_1 = round.take_turn('Juneau')
    turn_2 = round.take_turn('Venus')
    turn_3 = round.take_turn('North')

    expect(round.percent_correct).to eq(33)
  end

  it 'can calculate percent correct by category' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    turn_1 = round.take_turn('Juneau')
    turn_2 = round.take_turn('Venus')

    expect(round.percent_correct_by_category(:STEM)).to eq(0.to_f)
    expect(round.percent_correct_by_category(:Geography)).to eq(100.to_f)
  end
end
