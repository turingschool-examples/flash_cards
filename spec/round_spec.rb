require './lib/deck'
require './lib/card'
require './lib/turns'
require './lib/round'

RSpec.describe Card do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [card_1, card_2, card_3]
  deck = Deck.new([card_1, card_2, card_3])

  it 'exists' do
    expect(deck).to be_instance_of(Deck)
  end

  it 'is a round' do
    round = Round.new(deck)
    expect(round).to be_instance_of(Round)
  end

  it 'can round' do
    round = Round.new(deck)
    round.deck
    expect(round.deck).to be_a(Deck)
  end

  it 'has turns' do
    round = Round.new(deck)
    round.turns
    expect(round.turns).to eq([])
  end

  it 'is the current_card' do
    round = Round.new(deck)
    round.current_card
    expect(round.current_card).to eq(card_1)
  end

  it 'take_turn' do
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(new_turn).to be_a(Turn)
  end

  it 'is class' do
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(new_turn.class).to eq(Turn)
  end

  it 'is correct?' do
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(new_turn.correct?).to eq(true)
  end

  it 'can count turns' do
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(round.turns).to eq([new_turn])
  end

  it 'shows number_correct' do
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(round.number_correct).to eq(1)
  end 

  it 'is the current card card_2' do
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(round.current_card).to eq(card_2)
  end

  it 'take_turn "Venus"' do
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(round.current_card).to eq(card_2)
  end

  it 'round turns count' do
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    
    expect(round.current_card).to eq(card_2)
  end

  it 'provides feedback on last turn' do
    round = Round.new(deck)

    expect(round.deck).to eq(Deck)
  end

  it 'number_correct' do
    round = Round.new(deck)

    expect(round.deck).to eq(Deck)
  end

  it 'number_correct_by_category' do
    round = Round.new(deck)

    expect(round.deck).to eq(Deck)
  end

  it 'percent_correct' do
    round = Round.new(deck)

    expect(round.deck).to eq(Deck)
  end

  it 'percent_correct_by_category' do
    round = Round.new(deck)

    expect(round.deck).to eq(Deck)
  end

  it 'is the current_card' do
    round = Round.new(deck)

    expect(round.deck).to eq(Deck)
  end

end