require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'is created with the method new' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_a(Turn)
  end

  it 'provides instance variables from the card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.card

    expect(turn.card).to eq(card)
  end

  it 'provides the guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.guess

    expect(turn.guess).to eq("Juneau")
  end

  it 'tells if the guess is correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.correct?

    expect(turn.correct?).to eq(true)
  end

  it 'Provides feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.feedback

    expect(turn.feedback).to eq("Correct!")
  end
end
