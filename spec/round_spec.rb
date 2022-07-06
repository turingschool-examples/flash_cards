require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'

RSpec.describe Turn do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])

  it 'exists' do
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end


  it 'has a deck' do
    round = Round.new(deck)

    expect(round.deck).to be_instance_of(Deck)
  end


  it 'has turns' do
    round = Round.new(deck)

    expect(round.turn).to be_a(Array)
  end


  it 'gives current card' do
    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)
  end

  it 'takes a turn' do
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(new_turn.class).to be_a(Turn)
  end
  

  it 'identifies correct and incorrect guesses' do
    round = Round.new(deck)
    new_turn = round.take_turn(card_1.answer)

    expect(new_turn.correct?).to eq(true)

    round_two = Round.new(deck)
    new_turn_wrong = round_two.take_turn("Anchorage")

    expect(new_turn_wrong.correct?).to eq(false)
  end

  it 'saves turns into an array' do
    round = Round.new(deck)
    new_turn = round.take_turn(card_1.answer)

    expect(round.turns).to eq([new_turn])

  end


  it 'counts correct guesses' do
    round = Round.new(deck)
    turn_one = round.take_turn(card_1.answer)
    turn_two = round.take_turn("arbitrarily wrong")
    turn_three = round.take_turn("arbitrarily wrong")
    rounds = [turn_one, turn_two, turn_three]

    expect(rounds.number_correct).to eq(1)
  end

  it 'advances turn' do
    round = Round.new(deck)
    turn_one = round.take_turn(card_1.answer)

    expect(round.current_card).to eq(card_2)
  end

end
