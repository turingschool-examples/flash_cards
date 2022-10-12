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

  it 'can tell if a guess is correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    # turn1 = Turn.new("Kenai", card)

    expect(turn.correct?).to eq(true)
    # expect(turn1.correct?).to eq(false)
  end

  it 'provides feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    # turn1 = Turn.new("Kenai", card)
    turn2 = Turn.new("Juneau", card)

    # expect(turn1.feedback).to eq("Wrong!")
    expect(turn2.feedback).to eq("Correct!")
  end

  it 'can tell if a guess is wrong' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    expect(turn.correct?).to eq(false)
    expect(turn.feedback).to eq("Wrong!")
  end
end
