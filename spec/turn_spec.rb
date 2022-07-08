require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card1 = Card.new("true or false? 5 < 5", false, :Math)
    turn1 = Turn.new(false, card1)
    card2 = Card.new("What is the capital of Louisiana?", "Baton Rouge", :Geography)
    turn2 = Turn.new("New Orleans", card1)

    expect(turn1).to be_instance_of(Turn)
    expect(turn2).to be_instance_of(Turn)
  end

  it 'has a guess' do
    card = Card.new("In what state is Turing located?", "Colorado", :Geography)
    turn = Turn.new("Colorado", card)

    expect(turn.guess).to eq("Colorado")
  end

  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq(card)
  end

  it 'can tell if an answer is correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.correct?).to be true
  end

  it 'can tell if an answer is incorrect' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Baton Rouge", card)
    expect(turn.correct?).to be false
  end

  it 'give feedback as a string depending on the guess' do
    card1 = Card.new("true or false? 5 < 5", false, :Math)
    turn1 = Turn.new(false, card1)
    card2 = Card.new("What is the capital of Louisiana?", "Baton Rouge", :Geography)
    turn2 = Turn.new("New Orleans", card1)

    expect(turn1.feedback).to eq("Correct!")
    expect(turn2.feedback).to eq("Incorrect.")
  end

end
