require 'rspec'
require './lib/turn'
require './lib/card'

describe Turn do
  it 'Card exists' do
    card = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)

    expect(card).to be_a Card
  end

  it 'Turn exists' do
    card = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)
    turn = Turn.new("Oklahoma City", card)

    expect(turn).to be_a Turn
  end

  it 'Has a guess' do
    card = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)
    turn = Turn.new("Oklahoma City", card)

    expect(turn.guess).to eq "Oklahoma City"
  end

  it 'Returns true if you are correct' do
    card = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)
    turn = Turn.new("Oklahoma City", card)

    expect(turn.correct?).to eq true
  end

  it 'Returns false if you are incorrect' do
    card = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)
    turn = Turn.new("Tulsa", card)

    expect(turn.correct?).to eq false
  end

  it 'Returns string "Correct." if you are correct' do
    card = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)
    turn = Turn.new("Tulsa", card)

    expect(turn.feedback).to eq "Incorrect."
  end

  it 'Returns string "Incorrect." if you are incorrect' do
    card = Card.new("What is the capital of Oklahoma?", "Oklahoma City", :Geography)
    turn = Turn.new("Oklahoma City", card)

    expect(turn.feedback).to eq "Correct."
  end
end
