require './lib/card'
require './lib/turn'


RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn).to be_instance_of(Turn)
end

it 'has readable attributes' do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)
  expect(turn.card).to eq(card)
end

it 'returns guess' do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)
  expect(turn.guess).to eq("Juneau")
end

it 'returns correct?' do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)
  expect(turn.correct?).to eq(true)
  card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
  turn = Turn.new("Saturn", card)
  expect(turn.correct?).to eq(false)
end

it 'returns feedback' do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)
  expect(turn.feedback).to eq("Correct!")

  card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
  turn = Turn.new("Saturn", card)
  expect(turn.feedback).to eq("Incorrect!")
end

end
