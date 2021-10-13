require 'rspec'
require './lib/turn'
require './lib/card'


RSpec.describe Turn do
  it 'exists' do
    card = nil
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

it 'has a guess' do
  card = nil
  turn = Turn.new("Juneau", card)

  expect(turn.guess).to eq("Juneau")
  end

it 'checks if correct' do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)

  expect(turn.correct?).to eq(true)
  end

it 'checks if incorrect' do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("North Pole", card)

  expect(turn.correct?).to eq(false)

end

it 'gives feedback' do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)

  expect(turn.feedback).to eq("Correct!")
  end

  it 'critical feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card)

    expect(turn.feedback).to eq("Incorrect.")
    end
end
