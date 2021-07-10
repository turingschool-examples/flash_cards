require "./lib/turn"
require "./lib/card"

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

  it 'is correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq(true)

    card = Card.new("What is the capital of Thailand?", "Bangkok", :Geography)
    turn = Turn.new("Phuket", card)

    expect(turn.correct?).to eq(false)
  end

  it 'has a feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq("Correct!")

    card = Card.new("What is the capital of Thailand?", "Bangkok", :Geography)
    turn = Turn.new("Phuket", card)

    expect(turn.feedback).to eq("Incorrect.")
  end
end
