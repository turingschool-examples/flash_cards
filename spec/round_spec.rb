require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do

  before :each do
    @card_1 = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
    @card_2 = Card.new("Which element has the symbol 'Ne'?", "Neon", :NobleGases)
    @card_3 = Card.new("Which element has the symbol 'Xe'?", "Xenon", :NobleGases)


    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  it 'is a round of cards' do

    expect(@round).to be_instance_of Round
    expect(@round.deck).to eq(@deck)
  end

  it 'consists of turns' do

    expect(@round.turns).to eq([])
  end

  it 'is the first card in the deck' do

   expect(@round.current_card).to eq(@card_1)
  end

  it 'takes first turn' do
    new_turn = @round.take_turn("Hydrogen")

    expect(new_turn.class).to eq Turn
  end

  it 'checks if correct' do
    new_turn = @round.take_turn("Hydrogen")

    expect(new_turn.correct?).to be true
  end

  it 'is counting turns' do
    new_turn = @round.take_turn("Hydrogen")

    expect(@round.turns).to eq([new_turn])
  end

  it 'tallies correct response' do
    new_turn = @round.take_turn("Hydrogen")

    expect(@round.number_correct).to eq(1)
  end

  it 'is the second card in the deck' do
    new_turn = @round.take_turn("Neon")

    expect(@round.current_card).to eq(@card_2)
  end

  it 'still counts as a turn' do
    new_turn = @round.take_turn("Sodium")

    expect(@round.take_turn("Sodium")).to be_instance_of Turn
  end

  it 'tallies both turns' do
    new_turn = @round.take_turn("Hydrogen")
    new_turn = @round.take_turn("Sodium")

    expect(@round.turns.count).to eq(2)
  end

  it 'gives feedback for incorrect answer' do
    new_turn = @round.take_turn("Hydrogen")
    new_turn = @round.take_turn("Sodium")

    expect(@round.turns.last.feedback).to eq("Incorrect.")
  end

  it 'tallies correct answers' do
    new_turn = @round.take_turn("Hydrogen")
    new_turn = @round.take_turn("Sodium")

    expect(@round.number_correct).to eq(1)
  end

  it 'tallies correct by category' do
    new_turn = @round.take_turn("Hydrogen")

    expect(@round.number_correct_by_category(:ReactiveNonmetals)).to eq(1)
  end

  it 'gets no points for incorrect answers' do
    new_turn = @round.take_turn("Sodium")

    expect(@round.number_correct_by_category(:NobNobleGases)).to eq(0)
  end

  it 'got a percentage correct' do
    new_turn = @round.take_turn("Hydrogen")
    new_turn = @round.take_turn("Sodium")

    expect(@round.number_correct).to eq(1)
    expect(@round.percent_correct).to eq(50.0)
  end

  it 'measures percent correct by category' do
    new_turn = @round.take_turn("Hydrogen")

    expect(@round.number_correct_by_category(:ReactiveNonmetals)).to eq(1)
    expect(@round.percent_correct_by_category(:ReactiveNonmetals)).to eq(100.0)
  end

  it 'is the third card in the deck' do
    new_turn = @round.take_turn("Neon")
    new_turn = @round.take_turn("Xenon")

    expect(@round.current_card).to eq(@card_3)
  end
end
