require 'rspec'
require './lib/turn'
require './lib/card'
require 'pry'


RSpec.describe Turn do

  it 'exists' do
    card = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
    turn = Turn.new("Hydrogen", card)

    expect(turn).to be_instance_of Turn
  end

  it 'draws a card' do
    card = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
    turn = Turn.new("Hydrogen", card)

    expect(turn.card).to eq(card)
  end

  it 'guesses correctly' do
    card = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
    turn = Turn.new("Hydrogen", card)
    expect(turn.guess).to eq("Hydrogen")
  end

  it 'is correct' do
    card = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
    turn = Turn.new("Hydrogen", card)
    # turn2 = Turn.new("Helium", card)

    expect(turn.correct?).to be true
    # expect(turn2.correct?).to be false
  end

  it 'gives feedback for correct answer' do
    card = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
    turn = Turn.new("Hydrogen", card)
    # turn2 = Turn.new("Helium", card)

    expect(turn.feedback).to eq("Correct!")
    # expect(turn2.feedback).to eq("Incorrect.")
  end

  it 'guesses incorrectly' do
    card = Card.new("Which element has the symbol 'Ne'?", "Neon", :NobleGases)
    turn = Turn.new("Sodium", card)

    expect(turn.guess).to eq("Sodium")
  end

  it 'guesses incorrectly' do
    card = Card.new("Which element has the symbol 'Ne'?", "Neon", :NobleGases)
    turn = Turn.new("Sodium", card)

    expect(turn.correct?).to be false
  end

  it 'gives feedback for incorrect answer' do
    card = Card.new("Which element has the symbol 'Ne'?", "Neon", :NobleGases)
    # turn = Turn.new("Neon", card)
    turn = Turn.new("Sodium", card)

    # expect(turn.feedback).to eq("Correct!")
    expect(turn.feedback).to eq("Incorrect.")
  end
end
