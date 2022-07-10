require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end


  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq(card)
  end

  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

  expect(turn.guess).to eq("Juneau")
  end

  it 'is correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn_2 = Turn.new("Saturn", card)
  expect(turn.correct?).to eq(true)
  expect(turn_2.correct?).to eq(false)
  end

  it 'has feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Juneau", card)
    turn_2 = Turn.new("Saturn", card_2)
  expect(turn.feedback).to eq("Correct!")
  expect(turn_2.feedback).to eq("Incorrect.")
  end
end
