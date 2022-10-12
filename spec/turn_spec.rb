require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_a(Turn)
  end

  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to be_a(Card)
  end

  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end

  it 'can tell if guess is correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn1 = Turn.new("Kenai", card)

    expect(turn.correct?).to eq(true)
    expect(turn1.correct?).to eq(false)
  end
  it 'provides feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Kenai", card)
    turn2 = Turn.new("Juneau", card)

    expect(turn1.feedback).to eq("Wrong!")
    expect(turn2.feedback).to eq("Correct!")
  end
end
