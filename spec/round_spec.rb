require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  let(:card1) { Card.new('What is the capital of Alaska?', 'Juneau', :Geography) }
  let(:card2) { Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM) }
  let(:card3) { Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM) }
  let(:deck) { Deck.new([card1, card2, card3]) }
  let(:round) { Round.new(deck) }

  it 'exists' do
    expect(round).to be_instance_of(Round)
  end

  it 'has a deck' do
    expect(round.deck).to eq(deck)
  end

  it 'has no turns by default' do
    expect(round.turns).to be_empty
  end

  it 'knows the current card' do
    expect(round.current_card).to eq(card1)
  end

  it 'creates a new Turn instance when taking a turn' do
    new_turn = round.take_turn('Juneau')

    expect(new_turn).to be_instance_of(Turn)
  end

  it 'tracks turns taken' do
    expect(round.turns.length).to eq(0)

    round.take_turn('Juneau')

    expect(round.turns.length).to eq(1)

    round.take_turn('Mars')

    expect(round.turns.length).to eq(2)
  end

  it 'counts how many guesses are correct' do
    expect(round.number_correct).to eq(0)

    round.take_turn('Juneau')

    expect(round.number_correct).to eq(1)

    round.take_turn('I dunno')

    expect(round.number_correct).to eq(1)
  end

  it 'counts how many turns by category' do
    expect(round.turns_by_category(:STEM)).to eq(0)

    round.take_turn('Juneau')

    expect(round.turns_by_category(:STEM)).to eq(0)

    round.take_turn('Mars')

    expect(round.turns_by_category(:STEM)).to eq(1)

    round.take_turn('I dunno')

    expect(round.turns_by_category(:STEM)).to eq(2)
  end

  it 'counts how many guesses are correct by category' do
    expect(round.number_correct_by_category(:STEM)).to eq(0)

    round.take_turn('Juneau')

    expect(round.number_correct_by_category(:STEM)).to eq(0)

    round.take_turn('Mars')

    expect(round.number_correct_by_category(:STEM)).to eq(1)

    round.take_turn('I dunno')

    expect(round.number_correct_by_category(:STEM)).to eq(1)
  end

  it 'gives percentage correctly guessed' do
    expect(round.percent_correct).to eq(0)

    round.take_turn('Juneau')

    expect(round.percent_correct).to eq(100)

    round.take_turn('Jupiter')

    expect(round.percent_correct).to eq(50)

    round.take_turn('North north west')

    expect(round.percent_correct).to eq(67)
  end

  it 'gives percentage correctly guessed by category' do
    expect(round.percent_correct_by_category(:STEM)).to eq(0)

    round.take_turn('Juneau')

    expect(round.percent_correct_by_category(:STEM)).to eq(0)

    round.take_turn('Mars')

    expect(round.percent_correct_by_category(:STEM)).to eq(100)

    round.take_turn('I dunno')

    expect(round.percent_correct_by_category(:STEM)).to eq(50)
  end

  it 'counts how many cards have been played' do
    expect(round.card_count).to eq(1)

    round.take_turn('Juneau')

    expect(round.card_count).to eq(2)

    round.take_turn('Mars')

    expect(round.card_count).to eq(3)

    round.take_turn('I dunno')

    expect(round.card_count).to eq(4)
  end
end