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
    expect(turn.card).to eq(card)
  end

  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    guess = turn.guess()
    expect(turn.guess).to eq("Juneau")
  end

  it 'returns a boolean indicating if the guess matched the answer on the Card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.correct?).to eq(true)
  end

  it 'returns method either correct! or incorrect!' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.feedback).to eq("Correct!")
  end
end

it 'exists' do
  card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
  turn = Turn.new("Saturn", card)
  expect(turn).to_be_a(Turn)
end

xit 'has a card' do
  card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
  turn = Turn.new("Saturn", card)
  expect(turn.card).to eq(card)
end
