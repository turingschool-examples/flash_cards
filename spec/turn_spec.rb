require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    
    expect(turn.guess).to eq("Juneau")
  end

  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    
    expect(turn.card).to eq(card)
  end

  it 'input in correct? is correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq(true)
  end

  it 'input in feedback is Correct!' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.correct?

    expect(turn.feedback).to eq('Correct!')
  end

  it 'input in correct? is Incorrect' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Dallas", card)

    expect(turn.correct?).to eq(false)
  end

  it 'input in feedback is Incorrect' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Dallas", card)
    turn.correct?

    expect(turn.feedback).to eq('Incorrect.')
  end
end
