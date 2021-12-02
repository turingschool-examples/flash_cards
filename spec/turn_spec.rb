require '../lib/card'
require '../lib/turn'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn).to be_instance_of(Turn)
  end

  it 'guesses' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.guess).to eq('Juneau')
  end

  it 'is correct?' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.correct?).to be(true)
  end

  it 'gives correct feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of New York?", "New York", :Geography)
    turn = Turn.new("New York", card)
    turn2 = Turn.new("New York", card2)
    expect(turn.correct?).to be(false)
    expect(turn.feedback).to eq('Incorrect.')
    expect(turn2.correct?).to be(true)
    expect(turn2.feedback).to eq('Correct!')
  end
end
