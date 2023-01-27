require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is my name?", "Rontron", :People)
    turn = Turn.new("Rontron", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    card = Card.new("What is my name?", "Rontron", :People)
    turn = Turn.new("Rontron", card)

    expect(turn.guess).to eq("Rontron")
  end

  it 'has a card' do
    card = Card.new("What is my name?", "Rontron", :People)
    turn = Turn.new("Rontron", card)

    expect(turn.card).to be_instance_of(Card)
  end

  it 'can determine if an guess is correct' do
    card = Card.new("What is my name?", "Rontron", :People)
    turn = Turn.new("Rontron", card)

    expect(turn.correct?).to be true
  end

  it 'can determine if an guess is incorrect' do
    card = Card.new("What is my name?", "Rontron", :People)
    turn = Turn.new("Fred", card)

    expect(turn.correct?).to be false
  end
  
  it 'gives feedback based on if the guess is correct or incorrect' do
    card = Card.new("What is my name?", "Rontron", :People)
    turn = Turn.new("Rontron", card)
    turn2 = Turn.new("Fred", card)

    expect(turn.feedback).to eq("Correct!")
    expect(turn2.feedback).to eq("Incorrect! The correct answer was 'Rontron'")
  end
end
