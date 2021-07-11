require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)


  it 'exists' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round).to be_instance_of(Round)
  end

  it 'has deck' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round.deck).to eq(deck)
  end

  it 'has turns' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round.turns).to eq([])
  end

  it 'shows current card' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round.current_card).to eq(card_1)
  end

  it 'is Turn' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(new_turn.class).to eq(Turn)
  end

  it 'takes turn' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    new_turn.class
    expect(new_turn.class).to eq(Turn)
  end

  it 'is correct' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    new_turn.correct?

    expect(new_turn.correct?).to eq(true)
  end

  it 'tells number correct' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    new_turn.correct?

    expect(round.number_correct).to eq(1)
  end

  it 'moves to next card' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    round.current_card

    expect(round.current_card).to eq(card_2)
  end

  it 'accepts incorrect and moves turn count forward' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Venus")

    expect(new_turn.correct?).to eq(false)
    expect(round.turns.count).to eq(2)
    expect(round.turns.last.feedback).to eq("Incorrect.")
    expect(round.number_correct).to eq(1)
  end

  it 'tells number correct by category' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Venus")
    round.number_correct_by_category(:Geography)

    expect(round.number_correct_by_category(:Geography)).to eq(1)

    round.number_correct_by_category(:STEM)
    
    expect(round.number_correct_by_category(:STEM)).to eq(0)

  end

  it 'tells percent correct' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Venus")
    round.percent_correct

    expect(round.percent_correct).to eq(50.0)
  end

  it 'tells percent correct by category' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Venus")
    round.percent_correct_by_category(:Geography)

    expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
  end

  it 'has third card' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Venus")
    round.current_card

    expect(round.current_card).to eq(card_3)
  end
end
