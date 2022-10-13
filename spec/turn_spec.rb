require 'rspec'
require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  #test if it exists
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

#test it has a Card
  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq(card)
  end
#test it has a guess
it 'has a guess' do
card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
turn = Turn.new("Juneau", card)

expect(turn.guess).to eq("Juneau")
end
#test if correct?
it 'is correct?' do
card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
turn = Turn.new("Juneau", card)

expect(turn.correct?).to eq(true)
end
#test feedback
it 'return feedback' do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)

  expect(turn.feedback).to eq("correct!")
end
it 'exists' do
  card = Card.new("What planet is closest to the sun?", "Mercury", :STEM)
  turn = Turn.new("Saturn",card)

  expect(turn).to be_instance_of(Turn)
end
it 'is incorrect' do
  card = Card.new("What planet is closest to the sun?", "Mercury", :STEM)
  turn = Turn.new("Saturn",card)
expect(turn.correct?).to eq(false)
end
it 'provides feedback' do
  card = Card.new("What planet is closest to the sun?", "Mercury", :STEM)
  turn = Turn.new("Saturn",card)
  expect(turn.feedback).to eq("incorrect")
end
end
