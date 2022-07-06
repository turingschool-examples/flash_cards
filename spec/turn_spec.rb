require './lib/turn'
#require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    turn = Turn.new("guess", Card.new("What is the capital of Alaska?", "Juneau", :Geography))
    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    turn = Turn.new("guess", Card.new("What is the capital of Alaska?", "Juneau", :Geography))
    expect(turn.guess).to eq("guess")
  end

  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("guess", card)
    expect(turn.card).to eq(card)
  end

  it 'checks if the guess is correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("guess", card)
    expect(turn.correct?).to eq(false)
  end

  it 'returns proper feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("guess", card)
    expect(turn.feedback).to eq("Incorrect.")
  end

end
