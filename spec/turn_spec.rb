require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of California?", "Sacramento", :Geography)
    turn = Turn.new("Sacramento", card)
    expect(turn).to be_instance_of(Turn)
  end

  it 'guess uses Turn string' do
    card = Card.new("What is the capital of Colorado?", "Denver", :Geography)
    turn = Turn.new("Denver", card)
    expect(turn.guess).to eq("Denver")
  end

  it 'correct?' do
    card = Card.new("What is the capital of Connecticut?", "Stamford", :Geography)
    turn = Turn.new("Stamford", card)
    expect(turn.correct?).to eq(true)
  end

  it 'feedback when guess is correct' do
    card = Card.new("What is the capital of Delaware?", "Dover", :Geography)
    turn = Turn.new("Dover", card)
    expect(turn.feedback).to eq("Correct!")
  end

  it 'feedback when guess is incorrect' do
    card = Card.new("What is the capital of Florida?", "Tallahassee", :Geography)
    turn = Turn.new("Fort Lauderdale", card)
    expect(turn.feedback).to eq("Incorrect.")
  end
end
