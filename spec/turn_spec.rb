require 'rspec'
require './lib/turn'
require './lib/card'
require 'pry'


RSpec.describe Turn do
  it 'draws a card' do
    card = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
    turn = Turn.new("Hydrogen", card)
    expect(turn.card).to eq(card)
  end

  it 'guesses' do
    card = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
    turn = Turn.new("Hydrogen", card)
    expect(turn.guess).to eq("Hydrogen")
  end

  it 'guesses correctly' do
    card = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
    turn = Turn.new("Hydrogen", card)
    turn2 = Turn.new("Boron", card)

    expect(turn.correct?).to be true
    expect(turn2.correct?).to be false
  end

  it 'gives feedback' do
    card = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
    turn = Turn.new("Hydrogen", card)
    turn2 = Turn.new("Boron", card)

    expect(turn.feedback).to eq("Correct!")
    expect(turn2.feedback).to eq("Incorrect.")
  end
end
